package Lesson5;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;


import java.awt.event.*;


public class Sample5 extends JApplet {
	private JList<String> lst;
	private JScrollPane sp;
	private JButton bt;
	private JPanel pn;
	
	public void init(){
		String[] str={
    			"�\��܇","�ȥ�å�","���`�ץ󥫩`","�������`","���ݩ`�ĥ��`","�ߥ˥��`","��ܞ܇","��݆܇","�Х���","�w�ЙC",
    			"�إꥳ�ץ��`","���å�"};
		
		lst = new JList<String>(str);
		sp=new JScrollPane(lst);
		bt=new JButton("�ӥ�`�Ή��");
		pn= new JPanel();
		
		pn.add(bt);
		add(sp,BorderLayout.CENTER);
		add(pn,BorderLayout.SOUTH);
		
		bt.addActionListener(new SampleActionListener());
	}
    class SampleActionListener implements ActionListener{
    	public void actionPerformed(ActionEvent e){
    	Container cnt =getContentPane();
    	try{
    		UIManager.setLookAndFeel("com.sun.java.swing.plaf.motif.MotifLookAndFell");
    		SwingUtilities.updateComponentTreeUI(cnt);
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}
    	}
    	}
}
