package com.niit.test;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.UserDAO;
import com.niit.model.User;




public class UserTest 
{
	static UserDAO userDAO;
	
	@BeforeClass
	public static void initialize()
	{
		AnnotationConfigApplicationContext configApplnContext=new AnnotationConfigApplicationContext();
		configApplnContext.scan("com");
		configApplnContext.refresh();
		
		//SessionFactory sessionFactory=(SessionFactory)configApplnContext.getBean("DBConfig.class");
		
		userDAO=(UserDAO)configApplnContext.getBean("UserDAO");
	
	}
	@Test
	public void addUserTest()
	{
		User user=new User();
		user.setRole("ROLE_ADMIN");
		user.setEnabled("TRUE");
		user.setUserName("Ramya");
		user.setUserPassword("ramyakumar");
		user.setUserEmail("ramyajayakumar96@gmail.com");
		user.setUserAddress("India");
		user.setUserPhone("8903083744");
		assertTrue(userDAO.addUser(user));
	}
	
		
		
	
	@Ignore
	@Test

	public void updateUserTest()
	{
		User user=new User();
	
		user.setUserName("JMShirt");
		user.setUserEmail("abc@gmail.com");
		user.setUserPhone("987456123");
		user.setUserAddress("chl");
		user.setUserPassword("");
	user.setRole("user");
		
		
		assertTrue(userDAO.updateUser(user));
	}
	
	@Ignore
	@Test
	public void deleteUserTest()
	{
		User user=new User();
		user.setUserName("JMshirt");
		assertTrue(userDAO.deleteUser(user));
	}
	
	@Ignore
	@Test
	public void retrieveUserTest()
	{
		List<User> listUser=userDAO.retrieveUser();
		assertNotNull("Problem in Retriving ",listUser);
		this.show(listUser);
	}
	@Ignore
	public void show(List<User> listUser)
	{
		for(User user:listUser)
		{
			
			System.out.println("User Name:"+user.getUserName());
			System.out.println("User Email:"+user.getUserEmail());
			System.out.println("User Phone:"+user.getUserPhone());
		    System.out.println("User Address:"+user.getUserAddress());
			
		}
	}
	@Ignore
	@Test
	public void getUserTest()
	{		
		User user=userDAO.getUser("JMshirt");
       
		System.out.println("User Name:"+user.getUserName());
		System.out.println("User Email:"+user.getUserEmail());
		System.out.println("User Phone:"+user.getUserPhone());
	    System.out.println("User Address:"+user.getUserAddress());

		
		
		
		assertNotNull("Problem in Getting:",user);
	}

}







