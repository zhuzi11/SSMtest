package com.wisezone.service;

import java.util.List;

import com.wisezone.entity.Dept;
import com.wisezone.entity.DeptExample;
import com.wisezone.pojo.BootTablePojo;

public interface DeptService {

	long countByExample(DeptExample example); 
	  
	boolean insert(Dept record);

	List<Dept> selectByExample(DeptExample example);

	Dept selectByPrimaryKey(Integer deptId);

	boolean updateByPrimaryKeySelective(Dept record);

	boolean updateByPrimaryKey(Dept record);
	
	/**
	 * 分页方法
	 * @param example
	 * @return
	 */
	public BootTablePojo<Dept> searchPaging(DeptExample example);
	
	

}
