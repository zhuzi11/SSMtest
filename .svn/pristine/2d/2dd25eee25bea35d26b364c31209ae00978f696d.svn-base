package com.wisezone.service;

import java.util.List;

import com.wisezone.entity.Staff;
import com.wisezone.entity.StaffExample;
import com.wisezone.exception.AccountLockedException;
import com.wisezone.exception.UserNameAndPasswordErrorException;
import com.wisezone.pojo.BootTablePojo;

public interface StaffService {

	
	    long countByExample(StaffExample example); 

	    boolean insert(Staff record);
	 

	    List<Staff> selectByExample(StaffExample example);

	    Staff selectByPrimaryKey(Integer staffId);

	    boolean updateByPrimaryKeySelective(Staff record);

	    boolean updateByPrimaryKey(Staff record);
	    
	    /**
	     * 分页
	     * @param search
	     * @return
	     */
	    public BootTablePojo<Staff> searchPaging(StaffExample search);
	
	  
	    /**
	     *  登录
	     * @param loginName 用户名
	     * @param loginPwd 明文密码
	     * @return
	     */
	    public Staff login(String loginName,String loginPwd) throws UserNameAndPasswordErrorException,AccountLockedException;
	    
	    /**
	     * 验证登录名是否存在
	     * @param staff
	     * @return true代表已经使用了，false代表没有使用
	     */
	    public boolean checkLoginName(Staff staff);
}
