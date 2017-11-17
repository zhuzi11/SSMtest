package com.wisezone.mapper;

import com.wisezone.entity.Staff;
import com.wisezone.entity.StaffExample;
import java.util.List; 

public interface StaffMapper {
	
    long countByExample(StaffExample example);
 

    int insert(Staff record);
 

    List<Staff> selectByExample(StaffExample example);

    Staff selectByPrimaryKey(Integer staffId);

  

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(Staff record);
    
    /**
     * 登录
     * @param loginName
     * @return
     */
    public Staff login(String loginName);
    
    /**
     * 验证登录名是否存在
     * @param loginName
     * @return
     */
    public int checkLoginName(String loginName);
    
}