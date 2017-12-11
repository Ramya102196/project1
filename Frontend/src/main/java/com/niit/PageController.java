package com.niit;


import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.ProductDAO;

@Controller
public class PageController {

	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping(value="/login")
	public String showLoginPage()
	{
		return "Login";
	}
	@RequestMapping("/contactus")	
 	public String ContactUs()
 	{
 	  
 		return "ContactUs";
 	}
 
	
	@RequestMapping(value="/login_success")
	public String loginSuccess(Model m,HttpSession session)
	{
		String page_Url=null;
		String role=null;
		boolean loggedIn=false;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String logged_UserName = authentication.getName();
		
		session.setAttribute("username",logged_UserName);
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)authentication.getAuthorities();
		
		for(GrantedAuthority role1:authorities)
		{
			if(role1.getAuthority().equals("ROLE_ADMIN"))
			{
				loggedIn=true;
				page_Url="AdminHome";
				role="ROLE_ADMIN";
			}
			else
			{
				m.addAttribute("productList", productDAO.retrieveProduct());
				loggedIn=true;
				page_Url="ClientHome";
				role="ROLE_USER";
				
			}
		}
		session.setAttribute("loggedIn", loggedIn);
		session.setAttribute("role", role);
		return page_Url;
	}
}
