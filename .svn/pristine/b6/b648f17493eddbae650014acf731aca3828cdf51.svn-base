package com.wisezone.service;

import java.util.List;

import com.wisezone.entity.Questiontype;
import com.wisezone.entity.QuestiontypeExample;
import com.wisezone.pojo.QuestionTypePojo;

public interface QuestiontypeService {

	long countByExample(QuestiontypeExample example);

	boolean insert(Questiontype record);

	List<Questiontype> selectByExample(QuestiontypeExample example);

	Questiontype selectByPrimaryKey(Integer id);

	boolean updateByPrimaryKeySelective(Questiontype record);

	boolean updateByPrimaryKey(Questiontype record);

	/**
	 * 得到页面所有树形结构 
	 * @return
	 */
	public List<QuestionTypePojo> selectQuestionTypeTree();
	
}
