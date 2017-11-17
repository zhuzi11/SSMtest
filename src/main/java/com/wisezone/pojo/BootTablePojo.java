package com.wisezone.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * bootstrap table返回数据自定义对象
 * 
 * @author Administrator
 *
 */
public class BootTablePojo<T> {

	private long total = 0;
	private List<T> rows = new ArrayList<T>(0); // 数据

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public BootTablePojo(long total, List<T> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public BootTablePojo() {
		super();
	}

}
