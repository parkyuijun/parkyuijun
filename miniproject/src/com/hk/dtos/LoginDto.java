package com.hk.dtos;

public class LoginDto {
	
	
	String tid;
	String tpassword;
	String tname;
	String taddress;
	String tphone;
	String temail;
	String tenabled;
	String trole;
	
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	

	public LoginDto(String tid, String trole, String tname) {
		super();
		this.tid = tid;
		this.trole = trole;
		
	}






	public LoginDto(String tid, String tpassword, String tname, String taddress, String tphone, String temail,
			String tenabled, String trole) {
		super();
		this.tid = tid;
		
		this.tpassword = tpassword;
		this.tname = tname;
		this.taddress = taddress;
		this.tphone = tphone;
		this.temail = temail;
		this.tenabled = tenabled;
		this.trole = trole;
	}






	public LoginDto(String tid, String tpassword) {
		super();
		this.tid = tid;
		this.tpassword = tpassword;
		
	}






	






	public LoginDto(String tid, String taddress, String tphone, String temail) {
		super();
		this.tid = tid;
		this.taddress = taddress;
		this.tphone = tphone;
		this.temail = temail;
	}


	









	public LoginDto(String tid, String tname, String taddress, String tphone, String temail) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.taddress = taddress;
		this.tphone = tphone;
		this.temail = temail;
	}






	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	

	public String getTpassword() {
		return tpassword;
	}

	public void setTpassword(String tpassword) {
		this.tpassword = tpassword;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTaddress() {
		return taddress;
	}

	public void setTaddress(String taddress) {
		this.taddress = taddress;
	}

	public String getTphone() {
		return tphone;
	}

	public void setTphone(String tphone) {
		this.tphone = tphone;
	}

	public String getTemail() {
		return temail;
	}

	public void setTemail(String temail) {
		this.temail = temail;
	}

	public String getTenabled() {
		return tenabled;
	}

	public void setTenabled(String tenabled) {
		this.tenabled = tenabled;
	}

	public String getTrole() {
		return trole;
	}

	public void setTrole(String trole) {
		this.trole = trole;
	}






	@Override
	public String toString() {
		return "LoginDto [tid=" + tid + ", tpassword=" + tpassword + ", tname=" + tname
				+ ", taddress=" + taddress + ", tphone=" + tphone + ", temail=" + temail + ", tenabled=" + tenabled
				+ ", trole=" + trole + "]";
	}
	
	
	
	
}	
