package com.wisezone.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.Questiontype;
import com.wisezone.pojo.MessagePojo;
import com.wisezone.pojo.QuestionTypePojo;
import com.wisezone.service.QuestiontypeService;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/admin/type")
public class QuestionTypeController {

	@Autowired
	private QuestiontypeService questinTypeService;
	
	
	@RequestMapping(value="/search")
	public String search(Model model){
		
		List<QuestionTypePojo>  treeList=this.questinTypeService.selectQuestionTypeTree();
		
		model.addAttribute("arrType", treeList);
		
		return "questiontype/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public MessagePojo save(Questiontype questionType ){		
		MessagePojo  pojo=new MessagePojo();
		//typeName=ttt&sorts=23&id=1&parentId=2
		
		if(questionType.getParentId()==0){
			questionType.setTypeAttr("0");
			questionType.setParentId(null);  //数据库外键没有0的概念，变为null
		}else{
			questionType.setTypeAttr("0/"+questionType.getParentId());
		}
		
		//新增
		if(questionType.getId()==0){
			boolean result=this.questinTypeService.insert(questionType);
			pojo.setSuccess(result);
			pojo.setMessage(result?"新增分类成功":"新增分类失败");
		}else{
			//修改
			boolean result=this.questinTypeService.updateByPrimaryKeySelective(questionType);
			pojo.setSuccess(result);
			pojo.setMessage(result?"修改分类成功":"修改分类失败");
		}
		  
		
		return pojo;
	}
	
}
