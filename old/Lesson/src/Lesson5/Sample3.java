package Lesson5;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;

public class Sample3 extends JApplet {
	private JLabel lb;
	private JTable tb;
	private JScrollPane sp;
	
	public void init(){
		String[] colname ={"܇��","����","����"};
		String[][] data ={
				{"�\��܇","1200","10-1"}	,
				{"�ȥ�å�","2400","10-5"}	,	
				{"���`�ץ󥫩`","3600","10-6"}	,	
				{"�������`","2500","10-7"}	,	
				{"���ݩ`�ĥ��`","2600","10-8"}	,	
				{"�ߥ˥��`","300","10-9"}	,	
				{"��ܞ܇","800","10-10"}	,	
				{"��݆܇","600","10-11"}	,	
		};
		
		lb=new JLabel("���餷�㤤�ޤ���");
		tb=new JTable(data,colname);
		sp=new JScrollPane(tb);
		
		add(lb,BorderLayout.NORTH);
		add(sp,BorderLayout.CENTER);
	}
}
