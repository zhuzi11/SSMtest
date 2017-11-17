package com.wisezone.controller.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.Dept;
import com.wisezone.entity.DeptExample;
import com.wisezone.entity.DeptExample.Criteria;
import com.wisezone.pojo.BaseParamPojo;
import com.wisezone.pojo.BootTablePojo;
import com.wisezone.pojo.MessagePojo;
import com.wisezone.service.DeptService;
 

@Controller
@Scope(value="prototype")
@RequestMapping(value="/admin/dept")
public class DeptController {
	
	
	@Autowired
	private DeptService deptService;
	
	//显示部门查询页面
	@RequestMapping(value="/search")
	public String list( Model model){
		 
		return "dept/list";
	}
	
	//选择框
	@RequestMapping(value="/choose")
	public String choose( Model model){
		 
		return "dept/choose";
	}
	
	//admin/dept/list.jsp 中的bootstrap table发送的ajax请求
	@ResponseBody
	@RequestMapping(value="/api/data")   //order:asc/desc       sort:排序列
	public BootTablePojo<Dept> loadAjaxData(BaseParamPojo paramPojo,DeptExample search ){
		
		Criteria criteria=search.createCriteria();  //创建一个查询 对象
		  //判断状态
		if(paramPojo.getState()!=null && paramPojo.getState()>=0){
			criteria.andStateEqualTo(paramPojo.getState());
		}
		
		//如果排序的列不为空
		if(StringUtils.isNotBlank(paramPojo.getSort())){
			search.setOrderByClause( paramPojo.getSort() +" "+ paramPojo.getOrder() );
		}
		
		
		//分页查询 
	   BootTablePojo<Dept> bt= this.deptService.searchPaging(search);
		 
		return bt;
	}
	
	//新增或者修改数据(ajax)
	@ResponseBody
	@RequestMapping(value="/api/save",method=RequestMethod.POST)
	public MessagePojo save(Dept dept){		
		MessagePojo  pojo=new MessagePojo();
		
		//新增
		if(dept.getDeptId()==null || dept.getDeptId()==0){
			
			boolean result=this.deptService.insert(dept);
			pojo.setSuccess(result);
			pojo.setMessage(result?"添加部门成功":"添加部门失败的");
		}else{
			boolean result=this.deptService.updateByPrimaryKey(dept);
			pojo.setSuccess(result);
			pojo.setMessage(result?"修改部门成功":"修改部门失败的");
		}
		 
		return pojo;
	}
	

}
