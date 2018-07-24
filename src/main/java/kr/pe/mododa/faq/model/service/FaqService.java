package kr.pe.mododa.faq.model.service;

import java.util.ArrayList;

import kr.pe.mododa.faq.model.vo.Notice;

public interface FaqService {
	
	public ArrayList<Notice> noticeAll();
	public Notice noticeRead(int noticeNo);
}
