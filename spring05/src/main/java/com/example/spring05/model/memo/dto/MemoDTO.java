package com.example.spring05.model.memo.dto;

import java.util.Date;

public class MemoDTO {
	private int idx;
	private String userid;
	private String name;
	private String memo;
	private Date post_date; //java.util.Date
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "MemoDTO [idx=" + idx + ", userid=" + userid + ", name=" + name + ", memo=" + memo + ", post_date="
				+ post_date + "]";
	}
	
	
	

}
