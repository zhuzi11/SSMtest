package com.wisezone.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 后台管理员首页
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/admin")
public class IndexController {

	//首页
	@RequestMapping(value="/index")
	public String index(){
		
		return "index";
	}
	
	//取得系统的信息
	@RequestMapping(value="/systeminfo")
	public String systemInfoVersion(HttpSession session,Model model){
		
		model.addAttribute("javaVersion", System.getProperty("java.version") ); //java版本
		model.addAttribute("javaHome", System.getProperty("java.home"));
		
		model.addAttribute("osName",  System.getProperty("os.name"));
		model.addAttribute("osArch",  System.getProperty("os.arch"));
		
		//serverInfo
		model.addAttribute("serverInfo", session.getServletContext().getServerInfo());
		//servletVersion
		model.addAttribute("servletVersion", session.getServletContext().getMajorVersion()+"."+session.getServletContext().getMajorVersion());
		return "systeminfo";
	}
	 

}
