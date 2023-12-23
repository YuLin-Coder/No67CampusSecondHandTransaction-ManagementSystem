package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Supplyor
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
   private String name ;
   public String getName() 
   {
      return name;
  }
   public void setName(String name) 
   {
      this.name= name;
  }
   private String tel ;
   public String getTel() 
   {
      return tel;
  }
   public void setTel(String tel) 
   {
      this.tel= tel;
  }
   private String email ;
   public String getEmail() 
   {
      return email;
  }
   public void setEmail(String email) 
   {
      this.email= email;
  }
   private String address ;
   public String getAddress() 
   {
      return address;
  }
   public void setAddress(String address) 
   {
      this.address= address;
  }
   private String lxren ;
   public String getLxren() 
   {
      return lxren;
  }
   public void setLxren(String lxren) 
   {
      this.lxren= lxren;
  }
   private String fax ;
   public String getFax() 
   {
      return fax;
  }
   public void setFax(String fax) 
   {
      this.fax= fax;
  }
   private String des ;
   public String getDes() 
   {
      return des;
  }
   public void setDes(String des) 
   {
      this.des= des;
  }
}
