package Lesson5;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Sample11 extends JFrame {
      private JLabel lb;
      private JList<String> lst;
      private JScrollPane sp;
      
      public static void main(String[] args){
    	  Sample11 sm =new Sample11();
      }
      public Sample11(){
    	  super("����ץ�");
    	  
    	  String[] str={
      			"�\��܇","�ȥ�å�","���`�ץ󥫩`","�������`","���ݩ`�ĥ��`","�ߥ˥��`","��ܞ܇","��݆܇","�Х���","�w�ЙC",
      			"�إꥳ�ץ��`","���å�"};
    	  lb=new JLabel("���餷�㤤�ޤ���");
    	  lst=new JList<String>(str);
    	  sp = new JScrollPane(lst);
    	  
    	  add(lb,BorderLayout.NORTH);
    	  add(sp,BorderLayout.CENTER);
    	  
    	  addWindowListener(new SampleWindowListener());
    	  
    	  setSize(200,200);
    	  setVisible(true);
      }
      class SampleWindowListener extends WindowAdapter{
    	  public void windowClosing(WindowEvent e){
    		  System.exit(0);
    	  }
      }
}
