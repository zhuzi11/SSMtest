package com.wisezone.pojo;

import java.util.ArrayList;
import java.util.List;

import com.wisezone.entity.Questiontype;

/**
 * 自定义试题分类的数据结构 
 * @author Administrator
 *
 */
public class QuestionTypePojo {

	private Integer id;
	private String typeName;
	private Integer parentId;
	private Questiontype parentQuestionType; // 父类的对象
	private String typeAttr;
	private Integer sorts;
	// 子节点
	private List<QuestionTypePojo> childs = new ArrayList<QuestionTypePojo>(0);

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Questiontype getParentQuestionType() {
		return parentQuestionType;
	}

	public void setParentQuestionType(Questiontype parentQuestionType) {
		this.parentQuestionType = parentQuestionType;
	}

	public String getTypeAttr() {
		return typeAttr;
	}

	public void setTypeAttr(String typeAttr) {
		this.typeAttr = typeAttr;
	}

	public Integer getSorts() {
		return sorts;
	}

	public void setSorts(Integer sorts) {
		this.sorts = sorts;
	}

	public List<QuestionTypePojo> getChilds() {
		return childs;
	}

	public void setChilds(List<QuestionTypePojo> childs) {
		this.childs = childs;
	}

}
