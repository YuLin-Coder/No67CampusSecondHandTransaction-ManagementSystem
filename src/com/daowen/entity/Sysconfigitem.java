package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Sysconfigitem
{
@Id
@GeneratedValue(strategy =GenerationType.AUTO)
   private int id ;
   public int getId() 
   {
      return id;
  }
   public void setId(int id) 
   {
      this.id= id;
  }
   private String title ;
   public String getTitle() 
   {
      return title;
  }
   public void setTitle(String title) 
   {
      this.title= title;
  }
   private String dcontent ;
   public String getDcontent() 
   {
      return dcontent;
  }
   public void setDcontent(String dcontent) 
   {
      this.dcontent= dcontent;
  }
   private int cfgid ;
   public int getCfgid() 
   {
      return cfgid;
  }
   public void setCfgid(int cfgid) 
   {
      this.cfgid= cfgid;
  }
   private String cfgname ;
   public String getCfgname() 
   {
      return cfgname;
  }
   public void setCfgname(String cfgname) 
   {
      this.cfgname= cfgname;
  }
}
