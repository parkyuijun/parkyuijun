package com.hk.dtos;

import java.util.Date;

public class BoardDto {
	String pnum;
	int seq;
	String id;
	String title;
	String content;
	int ref;
	int step;
	int depth;
	int readcount;
	String delflag;
	Date regdate;
	String isnotice;
	String sellbuy;
	String fileup;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public BoardDto(String pnum, String id) {
		super();
		this.pnum = pnum;
		this.id = id;
	}
	
	
	




	

	public BoardDto(int seq, String id, String title, String content, int ref, int step, int depth, int readcount,
			String delflag, Date regdate, String isnotice, String sellbuy, String fileup) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.readcount = readcount;
		this.delflag = delflag;
		this.regdate = regdate;
		this.isnotice = isnotice;
		this.sellbuy = sellbuy;
		this.fileup = fileup;
	}




	public BoardDto(String id, String title, String content, String fileup) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.fileup = fileup;
	}

	
	
	public BoardDto(int seq, String title, String content) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
	}
	
	

	public BoardDto(int seq, String id, String title, String content) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
	}




	public int getSeq() {
		return seq;
	}




	public void setSeq(int seq) {
		this.seq = seq;
	}




	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public int getRef() {
		return ref;
	}




	public void setRef(int ref) {
		this.ref = ref;
	}




	public int getStep() {
		return step;
	}




	public void setStep(int step) {
		this.step = step;
	}




	public int getDepth() {
		return depth;
	}




	public void setDepth(int depth) {
		this.depth = depth;
	}




	public int getReadcount() {
		return readcount;
	}




	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}




	public String getDelflag() {
		return delflag;
	}




	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}




	public Date getRegdate() {
		return regdate;
	}




	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}




	public String getIsnotice() {
		return isnotice;
	}




	public void setIsnotice(String isnotice) {
		this.isnotice = isnotice;
	}




	public String getSellbuy() {
		return sellbuy;
	}




	public void setSellbuy(String sellbuy) {
		this.sellbuy = sellbuy;
	}

	


	public String getFileup() {
		return fileup;
	}




	public void setFileup(String fileup) {
		this.fileup = fileup;
	}




	@Override
	public String toString() {
		return "BoardDto [pnum=" + pnum + ", seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", readcount=" + readcount + ", delflag="
				+ delflag + ", regdate=" + regdate + ", isnotice=" + isnotice + ", sellbuy=" + sellbuy + ", fileup="
				+ fileup + "]";
	}

	


	
	
	
	
}
