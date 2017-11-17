package com.wisezone.mapper;

import java.util.List;

import com.wisezone.entity.Questions;
import com.wisezone.entity.QuestionsExample;

public interface QuestionsMapper {
    long countByExample(QuestionsExample example);

     
    int insert(Questions record);
 

    List<Questions> selectByExample(QuestionsExample example);

    Questions selectByPrimaryKey(Integer id);

   
    int updateByPrimaryKeySelective(Questions record);

    int updateByPrimaryKey(Questions record);
}