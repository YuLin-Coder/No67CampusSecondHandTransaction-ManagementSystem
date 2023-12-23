package com.daowen.service;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.daowen.entity.Sitenav;
import com.daowen.entity.Users;
import com.daowen.util.BeansUtil;

public class UsersServiceTest {

	// @Test
	// public void test() {
	// ApplicationContext ctx=new
	// ClassPathXmlApplicationContext("applicationContext.xml");
	// UsersService uService=(UsersService)ctx.getBean("usersService");
	// Users usersList=uService.getUser(1);
	// Assert.assertNotNull(usersList);
	// }

	@Test
	public void saveTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService");
		// SqlSessionFactory
		// sessionFactoryBean=(SqlSessionFactory)ctx.getBean("sqlSessionFactoryBean");
		Users u = new Users();
		u.setUsername("admin2");
		//int count = uService.save(u);
		//System.out.println("返回值=" + count);

	}

	@Test
	public void selectTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		SitenavService uService = (SitenavService) ctx
				.getBean("sitenavService");

		List<Sitenav> list = uService.getEntity();

	}

	@Test
	public void testBeanTest() {
		SitenavService uService = BeansUtil.getBean("sitenavService",
				SitenavService.class);

		System.out.println("testBean" + uService);

	}
	
	
	public <E> E testFan() {
		return null;
	}
	
	 /**
     * 方法一
     * @param map
     * @param list
     */
    public static void test01(Map<String,Object>map,List<String>list){
        System.out.println("Generic.test01()");
    }
    /**
     * 方法二
     * @return
     */
    public Map<Integer,Object>test02(){
        System.out.println("Generic.test02()");
        return null;
    }

	public static void main(String[] args)  {
//		 UsersServiceTest ut=new UsersServiceTest();
//		 ut.selectTest();
		// BeansUtil.getBean("sitenavBuilder", SitenavBuilder.class).build();
		// System.out.println(Modifier.isPublic(1025));
		// JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
		// Class.forName("").newInstance();
		//List list = new ArrayList<String>();
    
		//list.getClass().getField("").getGenericType()
		
//		 Method m = UsersServiceTest.class.getMethod("test01", Map.class,List.class);
//         Type [] t = m.getGenericParameterTypes();//获取参数泛型
//         for(Type paramType:t){
//             System.out.println("#"+paramType);
//             if(paramType instanceof ParameterizedType){
//                 Type[]genericTypes = ((ParameterizedType)paramType).getActualTypeArguments();
//                 for(Type genericType:genericTypes){
//                     System.out.println("泛型类型"+genericType);
//                 }
//             }
//         }
		//Class clazz= (new Test<Users>() {}).getClass(); // class java.lang.String

		SitenavService uc=BeansUtil.getBean("sitenavService", SitenavService.class);
        Sitenav sn=new Sitenav();
        sn.setTitle("测试");
        sn.setHref("123");
        sn.setSindex(1);
       //int count= uc.save(sn);
		
	}

}

class Test2<T> {
    public Class<T> getTClass() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

}  


