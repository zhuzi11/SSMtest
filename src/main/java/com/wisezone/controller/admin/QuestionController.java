package com.wisezone.controller.admin;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.Questions;
import com.wisezone.entity.QuestionsExample;
import com.wisezone.entity.QuestionsExample.Criteria;
import com.wisezone.entity.Questiontype;
import com.wisezone.pojo.BootTablePojo;
import com.wisezone.pojo.MessagePojo;
import com.wisezone.pojo.QuestionPojo;
import com.wisezone.pojo.QuestionTypePojo;
import com.wisezone.service.QuestionService;
import com.wisezone.service.QuestiontypeService;

@Controller
@Scope(value = "prototype")
@RequestMapping(value = "admin/question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private QuestiontypeService questionTypeService;

	// 显示页面
	@RequestMapping(value = "/search")
	public String show(Model model) {
		// 加载下拉 列表的数据
		List<QuestionTypePojo> allType = this.questionTypeService.selectQuestionTypeTree();
		model.addAttribute("allType", allType);

		return "question/list";
	}

	
	@ResponseBody  //{"success":true,message:"",title:""}
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public MessagePojo save(Questions questions ){		
		MessagePojo  pojo=new MessagePojo();
		//typeName=ttt&sorts=23&id=1&parentId=2
		
		Questiontype type = this.questionTypeService.selectByPrimaryKey(questions.getChildTypeId());
		
		questions.setParentTypeId(type.getParentId());
		//新增
		if(questions.getId()==0){
			boolean result=this.questionService.insert(questions);
			pojo.setSuccess(result);
			pojo.setMessage(result?"新增试题成功":"新增试题失败");
		}else{
			//修改
			boolean result=this.questionService.updateByPrimaryKeySelective(questions);
			pojo.setSuccess(result);
			pojo.setMessage(result?"修改试题成功":"修改试题失败");
		}
		  
		
		return pojo;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/api/data")
	public BootTablePojo<Questions> ajaxLoad(QuestionPojo paramPojo, QuestionsExample search) {

		// 如果排序的列不为空
		if (StringUtils.isNotBlank(paramPojo.getSort())) {
			search.setOrderByClause(paramPojo.getSort() + " " + paramPojo.getOrder());
		}

		// 拼查询 参数
		Criteria criteria = search.createCriteria(); // 创建一个查询 对象
		
		//难易程序
		if(paramPojo.getDifficult()>0){
			criteria=criteria.andDifficultEqualTo(paramPojo.getDifficult());
		}
		//试题类型
		if(paramPojo.getQuestionType()>0){
			criteria=criteria.andQuestionTypeEqualTo(paramPojo.getQuestionType());
		}
		
		//分类(不知道是子分类，还是主分类)
		if(paramPojo.getQuestionTypeId()>0){
			//查询分类信息
			Questiontype  qt=this.questionTypeService.selectByPrimaryKey(paramPojo.getQuestionTypeId());
			if(qt.getParentId()==null){
				criteria=criteria.andParentTypeIdEqualTo(paramPojo.getQuestionTypeId());  //按父节级节点查询
			}else{
				criteria=criteria.andChildTypeIdEqualTo(paramPojo.getQuestionTypeId()); //按子节点查询
			}
		}
		
		//查询

		BootTablePojo<Questions> pojo = this.questionService.searchPaging(search);

		return pojo;
	}

	@RequestMapping(value="/img")
	public String showImageTest(){
      
		return "question/testImage";
	}
	
	
}
