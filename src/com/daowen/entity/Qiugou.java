package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Qiugou
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
   private String pubren ;
   public String getPubren() 
   {
      return pubren;
  }
   public void setPubren(String pubren) 
   {
      this.pubren= pubren;
  }
   private Date pubtime ;
   public Date getPubtime() 
   {
      return pubtime;
  }
   public void setPubtime(Date pubtime) 
   {
      this.pubtime= pubtime;
  }
   private String jiage ;
   public String getJiage() 
   {
      return jiage;
  }
   public void setJiage(String jiage) 
   {
      this.jiage= jiage;
  }
   private String xinjiu ;
   public String getXinjiu() 
   {
      return xinjiu;
  }
   public void setXinjiu(String xinjiu) 
   {
      this.xinjiu= xinjiu;
  }
   private String szdi ;
   public String getSzdi() 
   {
      return szdi;
  }
   public void setSzdi(String szdi) 
   {
      this.szdi= szdi;
  }
   private String tupian ;
   public String getTupian() 
   {
      return tupian;
  }
   public void setTupian(String tupian) 
   {
      this.tupian= tupian;
  }
   private int clickcount ;
   public int getClickcount() 
   {
      return clickcount;
  }
   public void setClickcount(int clickcount) 
   {
      this.clickcount= clickcount;
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
   private String mobile ;
   public String getMobile() 
   {
      return mobile;
  }
   public void setMobile(String mobile) 
   {
      this.mobile= mobile;
  }
   private int typeid ;
   public int getTypeid() 
   {
      return typeid;
  }
   public void setTypeid(int typeid) 
   {
      this.typeid= typeid;
  }
   private String typename ;
   public String getTypename() 
   {
      return typename;
  }
   public void setTypename(String typename) 
   {
      this.typename= typename;
  }
   private String brandname ;
   public String getBrandname() 
   {
      return brandname;
  }
   public void setBrandname(String brandname) 
   {
      this.brandname= brandname;
  }
   private String xinghao ;
   public String getXinghao() 
   {
      return xinghao;
  }
   public void setXinghao(String xinghao) 
   {
      this.xinghao= xinghao;
  }
   private int state ;
   public int getState() 
   {
      return state;
  }
   public void setState(int state) 
   {
      this.state= state;
  }
}
