package com.daowen.service;

import org.springframework.stereotype.Service;

import com.daowen.entity.Spcategory;
import com.daowen.mapper.SpcategoryMapper;

@Service
public class SpcategoryTree extends RecursionTree<SpcategoryMapper> {

	public SpcategoryTree(){
	
		setTextfieldname("mingcheng");
		
	}
	
	 public void toNonLeaf(String id){
		   
		   Spcategory m=load("where id="+id);
		    if(m!=null)
		    {
			   // m.setIsleaf(0);
			    update(m);
		    }
	  }
	
	
	
}
