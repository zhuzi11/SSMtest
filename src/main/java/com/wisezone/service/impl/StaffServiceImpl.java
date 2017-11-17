package com.wisezone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.Staff;
import com.wisezone.entity.StaffExample;
import com.wisezone.exception.AccountLockedException;
import com.wisezone.exception.UserNameAndPasswordErrorException;
import com.wisezone.mapper.StaffMapper;
import com.wisezone.pojo.BootTablePojo;
import com.wisezone.service.StaffService;
import com.wisezone.util.MD5Util;

@Service
public class StaffServiceImpl implements StaffService{

	@Autowired
	private StaffMapper staffMapper;
	
	
	@Override
	public long countByExample(StaffExample example) {
	 
		return staffMapper.countByExample(example);
	}

	@Override
	public boolean insert(Staff record) {
	 
		return staffMapper.insert(record)>0;
	}

	@Override
	public List<Staff> selectByExample(StaffExample example) {
		 
		return staffMapper.selectByExample(example);
	}

	@Override
	public Staff selectByPrimaryKey(Integer staffId) {
		 
		return staffMapper.selectByPrimaryKey(staffId);
	}

	@Override
	public boolean updateByPrimaryKeySelective(Staff record) {
		 
		return staffMapper.updateByPrimaryKeySelective(record)>0;
	}

	@Override
	public boolean updateByPrimaryKey(Staff record) { 
		return staffMapper.updateByPrimaryKey(record)>0;
	}

	@Override
	public BootTablePojo<Staff> searchPaging(StaffExample search) {
		
		List<Staff> rows=this.selectByExample(search);
		
		long  count=this.countByExample(search);
		 
		return new BootTablePojo<>(count, rows);
	}

	@Override
	public Staff login(String loginName,String loginPwd) throws UserNameAndPasswordErrorException,AccountLockedException {
		Staff  staff=this.staffMapper.login(loginName);
		
		if(staff!=null){			
			//把用户密码加密
			String md5Pwd=MD5Util.MD5Encode(loginPwd,  staff.getSalt());
			
			if(!md5Pwd.equals( staff.getLoginPwd())){
				 throw new UserNameAndPasswordErrorException();
			}
			
			if(staff.getState()==0){
				throw new AccountLockedException();   //账户被锁定
			} 
		}else{
			//账户找不到
			 throw new UserNameAndPasswordErrorException();
		}
		
		return staff;
	}

	//true代表已经使用了，false代表没有使用
	@Override
	public boolean checkLoginName(Staff staff) {
	    
		int count=0;
		//新增
		if( staff.getStaffId()==null || staff.getStaffId()==0){
			count=this.staffMapper.checkLoginName(staff.getLoginName());
		}else{
			//修改要先查询原来用户名是什么
			Staff oldStaff=this.staffMapper.selectByPrimaryKey( staff.getStaffId());
			
			if(!oldStaff.getLoginName().equals(staff.getLoginName())){
				
				count=this.staffMapper.checkLoginName(staff.getLoginName());
			} 
		} 
		
		return count>0;
	}

	
}
