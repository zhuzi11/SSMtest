package com.wisezone.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.Questions;
import com.wisezone.entity.QuestionsExample;
import com.wisezone.mapper.QuestionsMapper;
import com.wisezone.pojo.BootTablePojo;
import com.wisezone.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionsMapper questionMapper;
	
	
	@Override
	public long countByExample(QuestionsExample example) {
		 
		return this.questionMapper.countByExample(example);
	}

	@Override
	public boolean insert(Questions record) {
	 
		return this.questionMapper.insert(record)>0;
	}

	@Override
	public List<Questions> selectByExample(QuestionsExample example) {
		 
		return this.questionMapper.selectByExample(example);
	}

	@Override
	public Questions selectByPrimaryKey(Integer id) {
		 
		return this.questionMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean updateByPrimaryKeySelective(Questions record) {
		 
		return this.questionMapper.updateByPrimaryKeySelective(record)>0;
	}

	@Override
	public boolean updateByPrimaryKey(Questions record) {
		 
		return this.questionMapper.updateByPrimaryKey(record)>0;
	}

	@Override
	public BootTablePojo<Questions> searchPaging(QuestionsExample example) {
		 
		List<Questions>  arr=this.selectByExample(example);
		long count=this.countByExample(example);
		  
		return new BootTablePojo<>(count, arr);
	}

}
