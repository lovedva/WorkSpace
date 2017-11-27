package Lesson5;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;

public class Sample1 extends JApplet{
    private JLabel lb;
    private JList<String> lst;
    private JScrollPane sp;
    
    public void init(){
    	String[] str={
    			"�\��܇","�ȥ�å�","���`�ץ󥫩`","�������`","���ݩ`�ĥ��`","�ߥ˥��`","��ܞ܇","��݆܇","�Х���","�w�ЙC",
    			"�إꥳ�ץ��`","���å�"};
    	lb=new JLabel("���餷�㤤�ޤ���");
    	lst =new JList<String>(str);
    	sp =new JScrollPane(lst);
    	
    	add(lb,BorderLayout.NORTH);
		add(sp,BorderLayout.CENTER);
		
		lst.addListSelectionListener((ListSelectionListener) new SampleListSelectionListener());
    }
    class SampleListSelectionListener implements ListSelectionListener{
    	public void valueChanged(ListSelectionEvent e){
    	JList tmp=(JList)e.getSource();
    	String str =(String)tmp.getSelectedValue();
    	lb.setText(str+"�Ǥ���");
    	}
    }
}
