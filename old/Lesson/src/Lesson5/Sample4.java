package Lesson5;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.*;
import java.awt.event.*;
import java.text.*;
import java.util.*;

public class Sample4 extends JApplet {
	private JLabel lb;
	private JTable tb;
	private JScrollPane sp;
	
	public void init(){
   
    	lb=new JLabel("���餷�㤤�ޤ���");
    	tb =new JTable(new MyTableModel());
    	sp =new JScrollPane(tb);
    	
    	add(lb,BorderLayout.NORTH);
		add(sp,BorderLayout.CENTER);
    }
	   class MyTableModel extends AbstractTableModel{
		   DateFormat df;
		   public MyTableModel(){
			   df =new SimpleDateFormat("yyyy/MM/dd");
		   }
		   public int getRowCount(){
			   return 50;
		   }
		   public int getColumnCount(){
			   return 2;
		   }
		   public Object getValueAt(int row,int column){
		    Calendar cl=Calendar.getInstance();
		    cl.setTime(new Date());
		    cl.add(Calendar.DATE, row);
		    
		    switch(column) {
		    	case 0:
		    		return (df.format(cl.getTime()));
		    	case 1:
		    		if (cl.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY){
		    			return "���դǤ�";
		    		}else{
		    				return "�ӘI�դǤ�";
		    		}
		    	default:
		    		return "";	
		    }	    	
		    	}
		    public String getColumnName(int column){
		    	switch(column){
		    	case 0:
		    		return "�ո�";
		    	case 1:
		    		return "�ӘI";
		    	default:
		    		return "";		
		    	
		    }
		   }
	   }
}
