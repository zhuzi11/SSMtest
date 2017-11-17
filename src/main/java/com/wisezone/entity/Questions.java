package com.wisezone.entity;

import java.io.Serializable;

/**
 * @author
 */
public class Questions implements Serializable {
	private Integer id;

	private String questionName;

	private Integer parentTypeId;

	private Questiontype parentQuestiontype;

	private Integer childTypeId;

	private Questiontype childQuestiontype;

	private Integer difficult;

	private String answer;

	private Integer questionType;

	private String choisea;

	private String choiseb;

	private String choisec;

	private String choised;

	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestionName() {
		return questionName;
	}

	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}

	public Integer getParentTypeId() {
		return parentTypeId;
	}

	public void setParentTypeId(Integer parentTypeId) {
		this.parentTypeId = parentTypeId;
	}

	public Integer getChildTypeId() {
		return childTypeId;
	}

	public void setChildTypeId(Integer childTypeId) {
		this.childTypeId = childTypeId;
	}

	public Integer getDifficult() {
		return difficult;
	}

	public void setDifficult(Integer difficult) {
		this.difficult = difficult;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Integer questionType) {
		this.questionType = questionType;
	}

	public String getChoisea() {
		return choisea;
	}

	public void setChoisea(String choisea) {
		this.choisea = choisea;
	}

	public String getChoiseb() {
		return choiseb;
	}

	public void setChoiseb(String choiseb) {
		this.choiseb = choiseb;
	}

	public String getChoisec() {
		return choisec;
	}

	public void setChoisec(String choisec) {
		this.choisec = choisec;
	}

	public String getChoised() {
		return choised;
	}

	public void setChoised(String choised) {
		this.choised = choised;
	}

	public Questiontype getParentQuestiontype() {
		return parentQuestiontype;
	}

	public void setParentQuestiontype(Questiontype parentQuestiontype) {
		this.parentQuestiontype = parentQuestiontype;
	}

	public Questiontype getChildQuestiontype() {
		return childQuestiontype;
	}

	public void setChildQuestiontype(Questiontype childQuestiontype) {
		this.childQuestiontype = childQuestiontype;
	}

}