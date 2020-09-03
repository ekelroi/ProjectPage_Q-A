package kr.spring.questAnswer.domain;

import java.sql.Date;
import java.util.Arrays;
import java.io.IOException;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class QuestAnswerVO {
	private	int	mem_num;
	private	int	q_num;
	@NotEmpty
	private	String q_title;
	@NotEmpty
	private	String question;
	private	String answer;
	private String id;
	private int q_hit;
	private MultipartFile q_upload;
	private byte[] q_uploadfile;
	private String q_filename;
	private	Date q_reg_date;
	private	Date q_modify_date;
	private	Date a_reg_date;
	private	Date a_modify_date;
	
	public void setQ_upload(MultipartFile q_upload) throws IOException {
		this.q_upload = q_upload;
		
		//byte[]로 변환
		setQ_uploadfile(q_upload.getBytes());
		//파일명 구하기
		setQ_filename(q_upload.getOriginalFilename());
	}
	
	//byte[] 타입의 필드 uploadfile는 제외
	@Override
	public String toString() {
		return "QuestAnswerVO [mem_num=" + mem_num + ", q_num=" + q_num + ", q_title=" + q_title + ", question="
				+ question + ", answer=" + answer + ", id=" + id + ", q_hit=" + q_hit + ", q_upload=" + q_upload
				+ ", q_filename=" + q_filename + ", q_reg_date=" + q_reg_date + ", q_modify_date=" + q_modify_date
				+ ", a_reg_date=" + a_reg_date + ", a_modify_date=" + a_modify_date + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}	
	public MultipartFile getQ_upload() {
		return q_upload;
	}

	

	public byte[] getQ_uploadfile() {
		return q_uploadfile;
	}

	public void setQ_uploadfile(byte[] q_uploadfile) {
		this.q_uploadfile = q_uploadfile;
	}

	public String getQ_filename() {
		return q_filename;
	}

	public void setQ_filename(String q_filename) {
		this.q_filename = q_filename;
	}

	public Date getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(Date q_reg_date) {
		this.q_reg_date = q_reg_date;
	}
	public Date getQ_modify_date() {
		return q_modify_date;
	}
	public void setQ_modify_date(Date q_modify_date) {
		this.q_modify_date = q_modify_date;
	}

	public Date getA_reg_date() {
		return a_reg_date;
	}

	public void setA_reg_date(Date a_reg_date) {
		this.a_reg_date = a_reg_date;
	}

	public Date getA_modify_date() {
		return a_modify_date;
	}

	public void setA_modify_date(Date a_modify_date) {
		this.a_modify_date = a_modify_date;
	}
	
}
