package Lesson5;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;

public class Sample2 extends JApplet{
    private JLabel lb;
    private JComboBox<String> cb;
    
    public void init(){
    	String[] str={
    			"�\��܇","�ȥ�å�","���`�ץ󥫩`","�������`","���ݩ`�ĥ��`","�ߥ˥��`","��ܞ܇","��݆܇","�Х���","�w�ЙC",
    			"�إꥳ�ץ��`","���å�"};
    	lb=new JLabel("���餷�㤤�ޤ���");
       cb=new JComboBox<String>(str);
    	
    	add(lb,BorderLayout.NORTH);
		add(cb,BorderLayout.SOUTH);
		
		cb.addActionListener(new SampleActionListener());
    }
    class SampleActionListener implements ActionListener{
    	public void actionPerformed(ActionEvent e){
    	JComboBox tmp=(JComboBox)e.getSource();
    	String str =(String)tmp.getSelectedItem();
    	lb.setText(str+"�Ǥ���");
    	}
    }
}
