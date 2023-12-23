package com.daowen.entity;
import java.util.Date;
import javax.persistence.*;
@Entity
public class Hytype
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
   private Double discount ;
   public Double getDiscount() 
   {
      return discount;
  }
   public void setDiscount(Double discount) 
   {
      this.discount= discount;
  }
}
