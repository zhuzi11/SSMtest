package com.wisezone.service;

import java.util.List;

import com.wisezone.entity.Questions;
import com.wisezone.entity.QuestionsExample;
import com.wisezone.pojo.BootTablePojo;

public interface QuestionService {
	
	   long countByExample(QuestionsExample example);

     
	    boolean insert(Questions record);
	 

	    List<Questions> selectByExample(QuestionsExample example);

	    Questions selectByPrimaryKey(Integer id);

	   
	    boolean updateByPrimaryKeySelective(Questions record);

	    boolean updateByPrimaryKey(Questions record);
	    
	    /**
	     * 分页
	     * @param example
	     * @return
	     */
	    public BootTablePojo<Questions>  searchPaging(QuestionsExample example);
	    
}
