package Lesson4;
import java.awt.event.*;
import java.awt.*;
import javax.swing.*;
public class Sample11 extends JApplet{
	private JLabel lb;
	private JPanel pn;
	private JCheckBox ch1,ch2,tmp;
	public void init(){
		lb=new JLabel("���餷�㤤�ޤ���");
		pn =	new JPanel();
		ch1=new JCheckBox("܇");
		ch2= new JCheckBox("�ȥ�å�");
		
		pn.add(ch1);
		pn.add(ch2);
		add(lb,BorderLayout.NORTH);
		add(pn,BorderLayout.SOUTH);
		
		ch1.addItemListener(new SampleItemListener());
		ch2.addItemListener(new SampleItemListener());
	}
	class SampleItemListener implements ItemListener{
		public void itemStateChanged(ItemEvent e){
			if(e.getStateChange()==ItemEvent.SELECTED){
				tmp =(JCheckBox)e.getSource();
				lb.setText(tmp.getText()+"���x�Ӥޤ���");
			}else if(e.getStateChange()==ItemEvent.DESELECTED){
				tmp =(JCheckBox)e.getSource();
				lb.setText(tmp.getText()+"����ޤ���");
			}
		}
	}
}
