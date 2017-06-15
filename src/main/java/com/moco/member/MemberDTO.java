package com.moco.member;

import java.sql.Date;

public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private Date birth;
	private String address;
	private String phone;
	private String email;
	private String kind;
	private String grade;
	private int likes;
	private int point;
	private int avaliableLikes;
	private int joinState;
	private String Oname;
	private String Fname;
	
	public String getOname() {
		return Oname;
	}
	public void setOname(String oname) {
		Oname = oname;
	}
	public String getFname() {
		return Fname;
	}
	public void setFname(String fname) {
		Fname = fname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getAvaliableLikes() {
		return avaliableLikes;
	}
	public void setAvaliableLikes(int avaliableLikes) {
		this.avaliableLikes = avaliableLikes;
	}
	public int getJoinState() {
		return joinState;
	}
	public void setJoinState(int joinState) {
		this.joinState = joinState;
	}
}
