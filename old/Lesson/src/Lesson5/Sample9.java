package Lesson5;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.event.*;

public class Sample9 extends JApplet {
	private JLabel lb;
    private JButton bt;
    private JPanel pn;
    
    public void init(){
    	lb=new JLabel("���餷�㤤�ޤ���");
    	pn = new JPanel();
    	bt =new JButton("ُ��");
    	
    	pn.add(bt);
    	add(lb,BorderLayout.NORTH);
    	add(pn,BorderLayout.SOUTH);
    	
    	bt.addActionListener(new SampleActionListener());
    }
    class SampleActionListener implements ActionListener{
		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			Container cnt =getContentPane();
			String title = "ُ��";
			String msg="ُ�뤢�꤬�Ȥ��������ޤ���";
			int type= JOptionPane.INFORMATION_MESSAGE;
			 
			JOptionPane.showMessageDialog(cnt, msg,title,type);
		}
    }
}
