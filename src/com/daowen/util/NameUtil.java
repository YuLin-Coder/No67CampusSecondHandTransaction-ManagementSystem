package com.daowen.util;

public class NameUtil {
	
	
	public  static String toFirstUpper(String org){
		  
		
		  if(org==null)
			  return "";
		  char [] c=org.toCharArray();
		  if(c[0]>='a'&&c[0]<='z'){
			   int x=c[0];
			   c[0]=(char)(x-32);
		  }
		  
		  for(int i=1;i<c.length;i++)
		  {
		   if(c[i]>='A'&&c[i]<='Z')    
		    {
		     int x=c[i];
		     c[i]=(char)(x+32);
		    }    
		  }
		return new String(c);
	}

}
