package Lesson4;
import java.awt.event.*;
import java.awt.*;
import javax.swing.*;
public class Sample10 extends JApplet{
	private JLabel lb;
	private JPanel pn;
	private JButton bt;
	private Icon ic;
	
	public void init(){
		lb=new JLabel("���餷�㤤�ޤ���");
		pn =	new JPanel();
		bt = new JButton("ُ��");
		ic = new ImageIcon(getImage(getDocumentBase(),"Lesson4/car.jpg"));
		//����ݩ`�ͥ�Ȥ��O��
		bt.setIcon(ic);
		//����ƥʤؤ�׷��
		pn.add(bt);
		add(lb,BorderLayout.NORTH);
		add(pn,BorderLayout.SOUTH);
		//�ꥹ�ʤε��h
		bt.addActionListener((ActionListener) new SampleActionListener());
	}
	
	class SampleActionListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			lb.setText("��ُ�뤢�꤫�Ȥ��������ޤ�");
			bt.setEnabled(false);
		}
	}
}
