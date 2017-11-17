package com.wisezone.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.Questiontype;
import com.wisezone.entity.QuestiontypeExample;
import com.wisezone.mapper.QuestiontypeMapper;
import com.wisezone.pojo.QuestionTypePojo;
import com.wisezone.service.QuestiontypeService;

@Service
public class QuestiontypeServiceImpl implements QuestiontypeService{

	@Autowired
	private QuestiontypeMapper questionTypeMapper;
	
	
	@Override
	public long countByExample(QuestiontypeExample example) {
		 
		return this.questionTypeMapper.countByExample(example);
	}

	@Override
	public boolean insert(Questiontype record) {
		 
		return this.questionTypeMapper.insert(record)>0;
	}

	@Override
	public List<Questiontype> selectByExample(QuestiontypeExample example) {
	 
		return this.questionTypeMapper.selectByExample(example);
	}

	@Override
	public Questiontype selectByPrimaryKey(Integer id) {
		 
		return this.questionTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean updateByPrimaryKeySelective(Questiontype record) {
		 
		return this.questionTypeMapper.updateByPrimaryKeySelective(record)>0;
	}

	@Override
	public boolean updateByPrimaryKey(Questiontype record) {
		 
		return this.questionTypeMapper.updateByPrimaryKey(record)>0;
	}

	@Override
	public List<QuestionTypePojo> selectQuestionTypeTree() {
		 QuestiontypeExample example=new QuestiontypeExample();		 
		 example.setOrderByClause(" c.sorts asc ");
		
		
		 List<Questiontype> allType=this.selectByExample(example);
		 
		 //组成后的对象
		 List<QuestionTypePojo> treeList=new ArrayList<QuestionTypePojo>();
		 
		 for(Questiontype  q : allType){
			 //根节点
			 if(q.getParentId()==null || q.getParentId()==0){
				 QuestionTypePojo rootType=new QuestionTypePojo();
				 rootType.setId(q.getId());
				 rootType.setTypeName(q.getTypeName());
				 rootType.setSorts(q.getSorts());
				 rootType.setTypeAttr(q.getTypeAttr());
				 
				 loadRecursion(rootType, allType );
				 
				 //根节点放到 集合中去
				 treeList.add(rootType);
			 }
			 
		 } 
		
		return treeList;
	}
    
	//递归加载子节点
	private void loadRecursion(QuestionTypePojo rootType, List<Questiontype> allType) {
		 for(Questiontype  q : allType){
			 //子节点
			 if(q.getParentId()!=null && q.getParentId()==rootType.getId() ){
				 //实例化子节点
				 QuestionTypePojo childType=new QuestionTypePojo();
				 childType.setId(q.getId());
				 childType.setTypeName(q.getTypeName());
				 childType.setSorts(q.getSorts());
				 childType.setTypeAttr(q.getTypeAttr());
				 childType.setParentId(q.getParentId());  //父节的编号
				 childType.setParentQuestionType( q.getParentQuestionType()); //父节点的对象
				 //以后扩展  （递归）
				 //loadRecursion(childType,allType);
				 
				 //把子节点，装到父节点集合中去
				 rootType.getChilds().add(childType); 
			 }
		 }
	}
	
	

}
