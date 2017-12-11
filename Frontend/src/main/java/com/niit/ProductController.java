package com.niit;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.User;





@Controller
public class ProductController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="product",method=RequestMethod.GET)
	public String showProduct(Model m)
	{
		Product product = new Product();
		m.addAttribute(product);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		m.addAttribute("categoryList",this.getCatgories());
		m.addAttribute("supplierList", this.getSuppliers());
		return "Product";
	}
	
	@RequestMapping(value="updateProduct/{productId}",method=RequestMethod.GET)
	public String updateProduct(@PathVariable("productId") int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		m.addAttribute(product);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "UpdateProduct";
	}
	
	@RequestMapping(value="UpdateProduct",method=RequestMethod.POST)
	public String updateMyProduct(@ModelAttribute("product")Product product,Model m)
	{
		productDAO.updateProduct(product);
		
		Product product1 = new Product();
		m.addAttribute(product1);
		
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "Product";
		
	}
	
	@RequestMapping(value="deleteProduct/{productId}",method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		String path="E:\\project\\Frontend\\src\\main\\webapp\\resources\\images\\";
		/*String totalFileWithPath=path+String.valueOf(product.getProductId())+".jpg";*/
		
		/*File productImage = new File(totalFileWithPath);
		
		
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[]= fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("error",e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error","Problem in file Uploading");
		}*/
		productDAO.deleteProduct(product);
		m.addAttribute(product);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "Product";
	}
	
	public LinkedHashMap<Integer, String> getCatgories()
	{
		List<Category> listCategories = categoryDAO.retrieveCategory();
		LinkedHashMap<Integer, String> categoriesList = new LinkedHashMap<Integer,String>();
		
		for(Category category:listCategories)
		{
			 categoriesList.put(category.getCatId(),category.getCatName());
			 
		}
		return categoriesList;
	}
	
	public LinkedHashMap<Integer, Integer> getSuppliers()
	{
		List<Supplier> listSuppliers = supplierDAO.retrieveSupplier();
		LinkedHashMap<Integer, Integer> suppliersList = new LinkedHashMap<Integer,Integer>();
		
		for(Supplier supplier:listSuppliers)
		{
			suppliersList.put(supplier.getSupplierId(),supplier.getSupplierId());
			 
		}
		return suppliersList;
	}

	
	@RequestMapping(value="InsertProduct",method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product")Product product,@RequestParam("pimage")MultipartFile fileDetail,Model m)
	{
		productDAO.addProduct(product);
				
		String path="E:\\project\\Frontend\\src\\main\\webapp\\resources\\images\\";
		String totalFileWithPath=path+String.valueOf(product.getProductId())+".jpg";
		
		File productImage = new File(totalFileWithPath);
		
		
		if(!fileDetail.isEmpty())
		{
			try
			{
				byte fileBuffer[]= fileDetail.getBytes();
				FileOutputStream fos = new FileOutputStream(productImage);
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			}
			catch(Exception e)
			{
				m.addAttribute("error",e.getMessage());
			}
		}
		else
		{
			m.addAttribute("error","Problem in file Uploading");
		}
		
		Product product1= new Product();
		m.addAttribute(product1);
		List<Product> listProduct=productDAO.retrieveProduct();
		m.addAttribute("productList",listProduct);
		return "Product";
	}
	
	@RequestMapping(value="userHome")	
	public String showProducts(Model m)
	{
		List<Product> listProducts=productDAO.retrieveProduct();
		m.addAttribute("productList",listProducts);
		return "UserHome";
	}
	@RequestMapping(value="uhome")	
	public String showUhome(Model m)
	{
		List<Product> listProducts=productDAO.retrieveProduct();
		m.addAttribute("productList",listProducts);
		return "Uhome";
	}

	
	@RequestMapping(value="productDetails/{productId}")
	public String showProductDetails(@PathVariable("productId")int productId,Model m)
	{
		Product product = productDAO.getProduct(productId);
		m.addAttribute("product",product);
		return "ProductDetails";
	}
	@RequestMapping(value="productDesc/{productId}")
	public String showProductDesc(@PathVariable("productId")int productId,Model m)
	{
		Product product = productDAO.getProduct(productId);
		m.addAttribute("product",product);
		return "ProductDesc";
	}
	/*@RequestMapping(value="details/{productId}")
	public String showDetails(@PathVariable("productId")int productId,Model m)
	{
		Product product = productDAO.getProduct(productId);
		m.addAttribute("product",product);
		return "Details";
	}*/

	@RequestMapping("/productCustList")
	public ModelAndView productcustList(@RequestParam("catId") int catId,Model m)
	{
		
		System.out.println(catId);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productList",productDAO.getProduct(catId));
		mav.setViewName("ProductCustList");
		return mav;
	}
	@ModelAttribute
	public void fetchData(Model m)
	{
		m.addAttribute("catList",categoryDAO.retrieveCategory());
		m.addAttribute("supList",supplierDAO.retrieveSupplier());
	}
	@ModelAttribute
	public void addAttributes(Model m)
	{
		m.addAttribute("categoryList",categoryDAO.retrieveCategory());
		m.addAttribute("supplierList",supplierDAO.retrieveSupplier());
		m.addAttribute("userList",userDAO.retrieveUser());
	}
	

}
