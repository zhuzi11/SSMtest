package com.wisezone.mapper;

import com.wisezone.entity.Dept;
import com.wisezone.entity.DeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeptMapper {
    long countByExample(DeptExample example);

    int insert(Dept record);

    List<Dept> selectByExample(DeptExample example);

    Dept selectByPrimaryKey(Integer deptId);
 
    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);
}