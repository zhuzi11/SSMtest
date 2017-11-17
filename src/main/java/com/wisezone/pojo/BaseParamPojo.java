package com.wisezone.pojo;

/**
 * 基本查询 参数，使用bootstrap-table
 * 
 * @author Administrator
 *
 */
public class BaseParamPojo {

	private String sort;
	private String order;
	private Integer state;

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
