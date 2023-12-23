package com.daowen.service;

import java.util.List;

import org.junit.Test;

import com.daowen.entity.Users;
import com.daowen.jdbc.simplecrud.Adapter;
import com.daowen.jdbc.simplecrud.BeanListHandler;
import com.daowen.jdbc.simplecrud.MybatisAdapter;
import com.daowen.jdbc.simplecrud.NativeJdbcAdapter;
import com.daowen.jdbc.simplecrud.SimpleJdbc;

public class SimpleJdbcTest {

	//@Test
	public  void  springJdbcTest() throws Exception{
		
		Adapter adapter=new MybatisAdapter("applicationContext.xml", "sqlSessionFactoryBean");
		SimpleJdbc dapper=new SimpleJdbc(adapter);
		//DataTable dt= dapper.executeQuery("select * from users");
		//BeanListHandler blh=new BeanListHandler(Users.class);
		List<Users> list= (List<Users>)dapper.query("select * from users", new BeanListHandler(Users.class));
		for(Users u : list){
		   System.out.println("用户名"+u.getUsername());
		   System.out.println("用户名"+u.getCreatetime());
		}
		
		if(list!=null)
			System.out.print("已执行成功");
		else
			System.out.print("执行失败");
	}
	
	@Test
	public  void  nativeJdbcTest() throws Exception{
		
		Adapter adapter=new NativeJdbcAdapter("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/no67_campsh","root","123456");
		SimpleJdbc dapper=new SimpleJdbc(adapter);
		
		List<Users> list= (List<Users>)dapper.query("select * from users", new BeanListHandler(Users.class));
		for(Users u : list){
		   System.out.println("用户名"+u.getUsername());
		   System.out.println("用户名"+u.getCreatetime());
		}
		
		if(list!=null)
			System.out.print("已执行成功");
		else
			System.out.print("执行失败");
	}
	
}
