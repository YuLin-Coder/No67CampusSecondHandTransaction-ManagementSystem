package com.daowen.uibuilder;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

import com.daowen.entity.Users;
import com.daowen.jdbc.simplecrud.Adapter;
import com.daowen.jdbc.simplecrud.BeanListHandler;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.jdbc.simplecrud.MybatisAdapter;
import com.daowen.ssm.simplecrud.TableMetadata;
import com.daowen.util.NameUtil;

public abstract class UibuilderBase<T>{

	
    private SimpleJdbc simpleDao=null;
	private String lanmuclassname ="";
	private TableMetadata tm=null;
	
	public String getLanmuclassname() {
		
		return lanmuclassname;
		
	}
	public Class<T> getEntityClass() {
        Type type=getClass().getGenericSuperclass();
        if(type instanceof ParameterizedType){
        	return (Class<T>)((ParameterizedType)type).getActualTypeArguments()[0];
        }
        return null;
    }

	public void setLanmuclassname(String lanmuclassname) {
		this.lanmuclassname = lanmuclassname;
	}
	private String textfieldname;
	
	private  String imagefieldname;
	
	public UibuilderBase(String lanmuclassname,String textfieldname,String imagefieldname){
	  this.lanmuclassname=lanmuclassname;
	  this.textfieldname=textfieldname;
	  this.imagefieldname=imagefieldname;
	  Adapter adapter=new MybatisAdapter("applicationContext.xml", "sqlSessionFactoryBean");
	  this.simpleDao=new SimpleJdbc(adapter);
	  tm=TableMetadata.forClass(getEntityClass());
	}
	
	/**
	 * 
	 * @param topcount
	 * @param lanmudes
	 * @return
	 */
	public  String buildImageLanmu(String filter,int topCount,String  lanmudes){
		List list=null;
		String sql="";
		if(topCount>0)
			sql=MessageFormat.format("select  * from {0} {1} limit {2}  ",tm.getTableName(),filter,topCount );
		else
			sql=MessageFormat.format("select  * from {0}  {1} ",tm.getTableName(),filter );
		try {
			list=(List<Users>)simpleDao.query(sql, new BeanListHandler(getEntityClass()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buildImageLanmu(list, lanmudes);
	}
	
	/**
	 * 
	 * @param topcount
	 * @param lanmudes
	 * @return
	 */
	public  String buildTextLanmu(String filter,int topCount,String  lanmudes){
		
		String sql=MessageFormat.format("select  * from {0} {1} limit {2}  ",tm.getTableName(),filter,topCount );
		List list=null;
		try {
			list = (List<Users>)simpleDao.query(sql, new BeanListHandler(getEntityClass()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buildTextLanmu(list, lanmudes);
	}
public  String  buildTextLanmu(List list,String lanmudes,String cssclass){
		
		StringBuffer sb=new StringBuffer();
	    int i=0;
	    
	    sb.append(MessageFormat.format("<div class=\"{0}\">",cssclass));
	    sb.append("\r\n");
	    //栏目标题
	    sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>",lanmudes));
	    //
	    sb.append("<div class=\"content\">");
	    sb.append("<ul>");
		for(Iterator iterator = list.iterator();iterator.hasNext();){
		  Object object=iterator.next();
		  
		  sb.append(" <li >");
		  sb.append("\r\n");
		  String id="";
		  String texfieldvalue="";
		  String imagefieldvalue="";
		  try {
			id = object.getClass().getMethod("get"+NameUtil.toFirstUpper("id"), null).invoke(object, null).toString();
			texfieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(textfieldname), null).invoke(object, null).toString();
			//imagefieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(imagefieldname), null).invoke(object, null).toString();
		  } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  } 
		 
		  sb.append(MessageFormat.format("<a href=\"{0}info.jsp?id={1}\">",tm.getTableName(),id));
		  sb.append(MessageFormat.format("{0} ",texfieldvalue));
		  sb.append("</a>");
		  sb.append("\r\n");
		  
		  //end text-item
		  sb.append("</li>");
		  
		 
		  i++;
		}
		//end of text-items
		 sb.append("</ul>");
		//end of content
		 sb.append("</div>");
		 sb.append("\r\n");
		 //end of lanmu
		 sb.append("</div>");
		 return sb.toString();
	}
	
	/**
	 * 
	 * @param list  构建数据源
	 * @param lanmudes  栏目描述信息
	 * @return
	 */
	public String buildImageLanmu(List list,String lanmudes )
	{
		StringBuffer sb=new StringBuffer();
	    int i=0;
	    
	    sb.append(MessageFormat.format("<div class=\"{0}\">",lanmuclassname));
	    sb.append("\r\n");
	    //栏目标题
	    sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>",lanmudes));
	    //
	    sb.append("<div class=\"content\">");
	    sb.append("<div class=\"image-items\">");
		for(Iterator iterator = list.iterator();iterator.hasNext();){
		  Object object=iterator.next();
		  sb.append(" <div class=\"image-item image-size\">");
		  sb.append("\r\n");
		  String id="";
		  String texfieldvalue="";
		  String imagefieldvalue="";
		  try {
			id = object.getClass().getMethod("get"+NameUtil.toFirstUpper("id"), null).invoke(object, null).toString();
			texfieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(textfieldname), null).invoke(object, null).toString();
			imagefieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(imagefieldname), null).invoke(object, null).toString();
		  } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  } 
		 
		  sb.append(MessageFormat.format("<a href=\"{0}info.jsp?id={1}\">",tm.getTableName(),id));
		  sb.append(MessageFormat.format("<img src=\"{0}\"/> ",imagefieldvalue));
		  sb.append("</a>");
		  sb.append("\r\n");
		  sb.append(MessageFormat.format("<div class=\"text-info\"><a href=\"{0}info.jsp?id={1}\">{2}</a></div>",tm.getTableName(),id,texfieldvalue));
		  //end image-item
		  sb.append("</div>");
		  i++;
		}
		//end of images-items
		 sb.append("</div>");
		//end of content
		 sb.append("</div>");
		 sb.append("\r\n");
		 //end of lanmu
		 sb.append("</div>");
		 return sb.toString();
	}
	/**
	 * 
	 * @param list  构建数据源
	 * @param lanmudes  栏目描述信息
	 * @return
	 */
	public String buildTextLanmu(List list,String lanmudes )
	{
		StringBuffer sb=new StringBuffer();
	    int i=0;
	    
	    sb.append(MessageFormat.format("<div class=\"{0}\">",lanmuclassname));
	    sb.append("\r\n");
	    //栏目标题
	    sb.append(MessageFormat.format("<div class=\"title\"><strong>{0}</strong></div>",lanmudes));
	    //
	    sb.append("<div class=\"content\">");
	    sb.append("<ul>");
		for(Iterator iterator = list.iterator();iterator.hasNext();){
		  Object object=iterator.next();
		  
		  sb.append(" <li >");
		  sb.append("\r\n");
		  String id="";
		  String texfieldvalue="";
		  String imagefieldvalue="";
		  try {
			id = object.getClass().getMethod("get"+NameUtil.toFirstUpper("id"), null).invoke(object, null).toString();
			texfieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(textfieldname), null).invoke(object, null).toString();
			imagefieldvalue=object.getClass().getMethod("get"+NameUtil.toFirstUpper(imagefieldname), null).invoke(object, null).toString();
		  } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  } 
		 
		  sb.append(MessageFormat.format("<a href=\"{0}info.jsp?id={1}\">",tm.getTableName(),id));
		  sb.append(MessageFormat.format("{0} ",texfieldvalue));
		  sb.append("</a>");
		  sb.append("\r\n");
		  //end text-item
		  sb.append("</li>");
		  i++;
		}
		//end of text-items
		 sb.append("</ul>");
		//end of content
		 sb.append("</div>");
		 sb.append("\r\n");
		 //end of lanmu
		 sb.append("</div>");
		 return sb.toString();
	}
	
	
}
