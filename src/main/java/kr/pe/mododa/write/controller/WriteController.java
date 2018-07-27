package kr.pe.mododa.write.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;

public interface WriteController {
	
	public String writeReady();
	public String loadHeader();
	public String loadTumbnail();
	public void autoComplete(HttpServletRequest request,HttpServletResponse response, @RequestParam int memberNo) throws Exception;
	

}
