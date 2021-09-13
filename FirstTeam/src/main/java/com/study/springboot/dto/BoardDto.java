package com.study.springboot.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
	private int tid;
	private String tuserid;
	private String tcategory;
	private String mname;
	private String mtel;
	private String memail;
	private String title;
	private String tintro;
	private String tcontent;
	private String tfile;
	private Timestamp tdate;
	private Timestamp classstartdate;
	private Timestamp classenddate;
	private Timestamp regstartdate;
	private Timestamp regenddate;
	private String tspacetype;
	private String tspace;
	private int thit;
	private int tgroup;
	private int tmemnum;
	private int tnownum;
	private String payment;
	private int price;
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTuserid() {
		return tuserid;
	}
	public void setTuserid(String tuserid) {
		this.tuserid = tuserid;
	}
	public String getTcategory() {
		return tcategory;
	}
	public void setTcategory(String tcategory) {
		this.tcategory = tcategory;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTintro() {
		return tintro;
	}
	public void setTintro(String tintro) {
		this.tintro = tintro;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public String getTfile() {
		return tfile;
	}
	public void setTfile(String tfile) {
		this.tfile = tfile;
	}
	public Timestamp getTdate() {
		return tdate;
	}
	public void setTdate(Timestamp tdate) {
		this.tdate = tdate;
	}
	public Timestamp getClassstartdate() {
		return classstartdate;
	}
	public void setClassstartdate(Timestamp classstartdate) {
		this.classstartdate = classstartdate;
	}
	public Timestamp getClassenddate() {
		return classenddate;
	}
	public void setClassenddate(Timestamp classenddate) {
		this.classenddate = classenddate;
	}
	public Timestamp getRegstartdate() {
		return regstartdate;
	}
	public void setRegstartdate(Timestamp regstartdate) {
		this.regstartdate = regstartdate;
	}
	public Timestamp getRegenddate() {
		return regenddate;
	}
	public void setRegenddate(Timestamp regenddate) {
		this.regenddate = regenddate;
	}
	public String getTspacetype() {
		return tspacetype;
	}
	public void setTspacetype(String tspacetype) {
		this.tspacetype = tspacetype;
	}
	public String getTspace() {
		return tspace;
	}
	public void setTspace(String tspace) {
		this.tspace = tspace;
	}
	public int getThit() {
		return thit;
	}
	public void setThit(int thit) {
		this.thit = thit;
	}
	public int getTgroup() {
		return tgroup;
	}
	public void setTgroup(int tgroup) {
		this.tgroup = tgroup;
	}
	public int getTmemnum() {
		return tmemnum;
	}
	public void setTmemnum(int tmemnum) {
		this.tmemnum = tmemnum;
	}
	public int getTnownum() {
		return tnownum;
	}
	public void setTnownum(int tnownum) {
		this.tnownum = tnownum;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price=price;
	}

	
	
}
