package lesson7;

import java.io.Serializable;

public class CarBean implements Serializable {
     private String carname;
     private String cardata;
     
     public CarBean(){
    	 carname =null;
    	 cardata =null;
     }
     public void setCarname(String cn){
    	 carname=cn;
     }
     public String getCardata(){
    	 return cardata;
     }
     public void makeCardata(){
    	 cardata="܇�N��"+carname;
     }
}
