package com.wisezone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.Dept;
import com.wisezone.entity.DeptExample;
import com.wisezone.mapper.DeptMapper;
import com.wisezone.pojo.BootTablePojo;
import com.wisezone.service.DeptService;


@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptMapper  deptMapper;
	
	
	@Override
	public long countByExample(DeptExample example) {
		
		return this.deptMapper.countByExample(example);
	}

	@Override
	public boolean insert(Dept record) {
		 
		return this.deptMapper.insert(record)>0;
	}

	@Override
	public List<Dept> selectByExample(DeptExample example) {
		 
		return this.deptMapper.selectByExample(example);
	}

	@Override
	public Dept selectByPrimaryKey(Integer deptId) {
	 
		return this.deptMapper.selectByPrimaryKey(deptId);
	}

	@Override
	public boolean updateByPrimaryKeySelective(Dept record) {
		 
		return this.deptMapper.updateByPrimaryKeySelective(record)>0;
	}

	@Override
	public boolean updateByPrimaryKey(Dept record) {
		 
		return this.deptMapper.updateByPrimaryKey(record)>0;
	}

	//分页
	@Override
	public BootTablePojo<Dept> searchPaging(DeptExample example) {
		 
		long count=this.countByExample(example);
		List<Dept> arr=this.selectByExample(example);
		 
		return new BootTablePojo<Dept>(count, arr);
	}

}
