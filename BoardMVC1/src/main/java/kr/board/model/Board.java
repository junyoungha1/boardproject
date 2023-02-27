package kr.board.model;

import java.time.LocalDate;

public class Board {
	private int no;
	private String writer;
	private String date;
	private String subject;
	private String contents;
	
	public Board(){}

	public Board(int no, String writer, String date, String subject, String contents) {
		super();
		this.no = no;
		this.writer = writer;
		this.date = date;
		this.subject = subject;
		this.contents = contents;
	}

	public Board(String writer, String date, String subject, String contents) {
		super();
		this.writer = writer;
		this.date = date;
		this.subject = subject;
		this.contents = contents;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	

}
