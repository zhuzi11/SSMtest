package com.wisezone.controller.admin;

import java.util.List;

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
import com.wisezone.entity.Staff;
import com.wisezone.entity.StaffExample;
import com.wisezone.entity.StaffExample.Criteria;
import com.wisezone.pojo.BootTablePojo;
import com.wisezone.pojo.MessagePojo;
import com.wisezone.pojo.StaffParamPojo;
import com.wisezone.service.DeptService;
import com.wisezone.service.StaffService;
import com.wisezone.util.MD5Util;

import sun.security.provider.MD4;

@Controller
@Scope(value = "prototype")
@RequestMapping(value = "/admin/staff")
public class StaffController {

	@Autowired
	private StaffService staffService;

	@Autowired
	private DeptService deptService;

	@RequestMapping(value = "/search")
	public String list(Model model) {
		// 加载所有的部门信息
		DeptExample deptExample = new DeptExample();
		deptExample.createCriteria().andStateEqualTo(1);

		List<Dept> dept = this.deptService.selectByExample(deptExample);

		// 转发数据
		model.addAttribute("arrDept", dept);

		return "staff/list";
	}

	@ResponseBody
	@RequestMapping(value = "/api/data")
	public BootTablePojo<Staff> loadAjaxData(StaffParamPojo paramPojo, StaffExample search) {

		Criteria criteria = search.createCriteria(); // 创建一个查询 对象
		// 如果排序的列不为空
		if (StringUtils.isNotBlank(paramPojo.getSort())) {
			search.setOrderByClause(paramPojo.getSort() + " " + paramPojo.getOrder());
		}

		// 判断状态
		if (paramPojo.getState() != null && paramPojo.getState() >= 0) {
			criteria = criteria.andStateEqualTo(paramPojo.getState());
         
		}

		// 员工名称
		if (StringUtils.isNotBlank(paramPojo.getStaffName())) {
			criteria = criteria.andStaffNameLike("%" + paramPojo.getStaffName() + "%");
		}

		// 部门编号
		if (paramPojo.getDeptId() != null && paramPojo.getDeptId() > 0) {
			criteria = criteria.andDeptIdEqualTo(paramPojo.getDeptId());
		}

		return this.staffService.searchPaging(search);
	}

	@ResponseBody
	@RequestMapping(value="/api/save",method=RequestMethod.POST)
	public MessagePojo saveOrUpdate(Staff staff){
		MessagePojo  pojo=new MessagePojo();
		
		//新增
		if(staff.getStaffId()==0){
			//生成盐
			staff.setSalt( MD5Util.createSalte());
			staff.setLoginPwd( MD5Util.MD5Encode("8888", staff.getSalt()));
			
			boolean result=this.staffService.insert(staff);
			pojo.setSuccess(result);
			pojo.setMessage(result?"新增员工成功":"新增员工失败");
		}else{
			boolean result=this.staffService.updateByPrimaryKeySelective(staff);
			pojo.setSuccess(result);
			pojo.setMessage(result?"修改员工成功":"修改员工失败");
		} 
		return pojo;
	}
	
	//验证登录名是否存在
	@ResponseBody
	@RequestMapping(value="/check/loginname")
	public boolean checkLoginName(Staff staff){
		
		boolean result=this.staffService.checkLoginName(staff);
		
		//这要取反  result==false代表没有使用，没有使用代表 验证过通过(能输出 "true" 或 "false")
		return !result;
	}
	
	
}
