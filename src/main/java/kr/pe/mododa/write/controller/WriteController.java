package kr.pe.mododa.write.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WriteController {

		@Autowired
		@RequestMapping(value="/write.do")
		public String writeReady() {
			return "write/writePage";
		}
		
		@RequestMapping(value="/loadHeader.do")
		public String loadHeader() {
			return "write/header";
		}
}
