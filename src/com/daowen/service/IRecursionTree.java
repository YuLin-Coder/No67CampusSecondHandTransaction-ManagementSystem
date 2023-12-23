package com.daowen.service;

import java.util.List;


public interface IRecursionTree  {

	
	public List  getTree(int id);
	
	
	public String  getShowText(int id);
	
	
	public  void  deleteLeafNode(int id);
	
	public <T> Boolean  saveTreeNode(T t);
	
	
	
}
