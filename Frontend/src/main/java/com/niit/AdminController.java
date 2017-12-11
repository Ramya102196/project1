package com.niit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;


@Controller


public class AdminController {
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	@RequestMapping(value="adding")
	public String showAdding()
	{
		return "Adding";
	}

	@ModelAttribute
	public void fetchData(Model m)
	{
		m.addAttribute("catList",categoryDAO.retrieveCategory());
		m.addAttribute("supList",supplierDAO.retrieveSupplier());
	}
}
