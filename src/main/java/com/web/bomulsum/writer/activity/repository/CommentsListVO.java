package com.web.bomulsum.writer.activity.repository;

import java.sql.Date;

import org.springframework.stereotype.Repository;


/**
 * @author Nuri
 *
 */
public class CommentsListVO {

	private String comment_seq;
	private String member_code_seq;
	private String member_name;
	private String art_code_seq;
	private String art_name;
	private String comment_content;
	private String comment_status;
	private Date comment_date;
	private String comment_recomment;
	private Date comment_recomment_date;
	private String writer_code_seq;
	private String member_profile;
	public String getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(String comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getMember_code_seq() {
		return member_code_seq;
	}
	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getArt_code_seq() {
		return art_code_seq;
	}
	public void setArt_code_seq(String art_code_seq) {
		this.art_code_seq = art_code_seq;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_status() {
		return comment_status;
	}
	public void setComment_status(String comment_status) {
		this.comment_status = comment_status;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_recomment() {
		return comment_recomment;
	}
	public void setComment_recomment(String comment_recomment) {
		this.comment_recomment = comment_recomment;
	}
	public Date getComment_recomment_date() {
		return comment_recomment_date;
	}
	public void setComment_recomment_date(Date comment_recomment_date) {
		this.comment_recomment_date = comment_recomment_date;
	}
	public String getWriter_code_seq() {
		return writer_code_seq;
	}
	public void setWriter_code_seq(String writer_code_seq) {
		this.writer_code_seq = writer_code_seq;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	@Override
	public String toString() {
		return "CommentsListVO [comment_seq=" + comment_seq + ", member_code_seq=" + member_code_seq + ", member_name="
				+ member_name + ", art_code_seq=" + art_code_seq + ", art_name=" + art_name + ", comment_content="
				+ comment_content + ", comment_status=" + comment_status + ", comment_date=" + comment_date
				+ ", comment_recomment=" + comment_recomment + ", comment_recomment_date=" + comment_recomment_date
				+ ", writer_code_seq=" + writer_code_seq + ", member_profile=" + member_profile + "]";
	}
	
	
}
