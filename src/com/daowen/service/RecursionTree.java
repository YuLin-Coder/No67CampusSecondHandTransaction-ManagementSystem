package com.daowen.service;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.daowen.ssm.simplecrud.SimpleBizservice;
import com.daowen.ssm.simplecrud.SimpleMapper;
import com.daowen.util.NameUtil;

public class RecursionTree<MapperClass extends SimpleMapper> extends SimpleBizservice<MapperClass>  implements IRecursionTree{


	@Autowired
	private MapperClass mapper=null;

	public static int ROOTID=0;
	
    private String idfieldname="id";
    private String parentidfieldname="parentid";
    private String textfieldname="";

    private String isleaffieldname="isleaf";  
	
	public String getIdfieldname() {
		return idfieldname;
	}

	public void setIdfieldname(String idfieldname) {
		this.idfieldname = idfieldname;
	}

	public String getParentidfieldname() {
		return parentidfieldname;
	}

	public void setParentidfieldname(String parentidfieldname) {
		this.parentidfieldname = parentidfieldname;
	}

	public String getTextfieldname() {
		return textfieldname;
	}

	public void setTextfieldname(String textfieldname) {
		this.textfieldname = textfieldname;
	}

	public String getIsleaffieldname() {
		return isleaffieldname;
	}

	public void setIsleaffieldname(String isleaffieldname) {
		this.isleaffieldname = isleaffieldname;
	}

	/****
	 * 
	 * @param tablename
	 * @param parentid
	 * @return 返回树资源
	 */
	public   List getTree(int parentid){
		
		String filter=MessageFormat.format(" where {0}={1}", getParentidfieldname(),parentid);
		//获取
		List childNodes=mapper.getEntitys(filter);
		List childNodes3=new ArrayList<>();
 		Iterator it=childNodes.iterator();
		while(it.hasNext())
		{
			Object t=it.next();
			//加入元素
			childNodes3.add(t);
			try {
				
				int temId=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(idfieldname), null).invoke(t, null);
				int temIsleaf=(Integer) t.getClass().getMethod("get"+NameUtil.toFirstUpper(isleaffieldname), null).invoke(t, null);
				
				//如果不是叶子节点
				if(temIsleaf==0){
					List temchilds=getTree(temId);
					childNodes3.addAll(temchilds);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		return childNodes3;
	}
	
	
	/*
	 * 获取类别显示文本
	 * **/
	
	public  String getShowText( int id){
		
		
		String text="";
		if(id==ROOTID)
			return "系统根路径 ";
		
		try {
		
				Object  t=mapper.load(MessageFormat.format("where {0}={1}",getIdfieldname(),id));
				
				text=t.getClass().getMethod("get"+NameUtil.toFirstUpper(getTextfieldname()),null).invoke(t, null).toString();
				
				int parentid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(getParentidfieldname()), null).invoke(t, null);
				
				if(parentid!=ROOTID)
				{
					text=getShowText(parentid)+text;
				}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return text;
		
		
	}
	
	public void deleteLeafNode(int id){
		
		Object t=mapper.load( MessageFormat.format(" where {0}={1} ",getIdfieldname(),id));
		
	    int res=mapper.delete(MessageFormat.format(" where {0}={1} ",getIdfieldname(),id));
		if(res<=0)
			return;
	    	try {
				
	    		int parentid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(getParentidfieldname()), null).invoke(t, null);
				if(parentid!=ROOTID){
				  int parentchilds=mapper.getRecordCount(MessageFormat.format("where {0}={1}",getParentidfieldname(),parentid));
				  //如果父节点没有了元素则更新为叶子节点
				  if(parentchilds==0){
					  Object parentnode=mapper.load(MessageFormat.format("where {0}={1}",getIdfieldname(),parentid));
					  parentnode.getClass().getMethod("set"+NameUtil.toFirstUpper(getIsleaffieldname()), int.class).invoke(parentnode, 1);
					  mapper.update(parentnode);
				  }
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	    
	}
	
	public <T> Boolean saveTreeNode(T t){
		
		int result=mapper.save(t);
		if(result<=0)
			return false;
		try {
			
			int parentid=(Integer)t.getClass().getMethod("get"+NameUtil.toFirstUpper(getParentidfieldname()), null).invoke(t, null);
			T parentnode=(T)mapper.selectOne(parentid);
			if(parentnode!=null){
				System.out.println("执行叶子节点反射");
			    parentnode.getClass().getMethod("set"+NameUtil.toFirstUpper(getIsleaffieldname()), int.class).invoke(parentnode, 0);
			   return mapper.update(parentnode)>0?true:false;
			}
			else{
				return false;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return false;
		
	}
	
}