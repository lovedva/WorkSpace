package Lesson5;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.*;
public class Sample6 extends JApplet{
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
    	
    	lst.setCellRenderer(new SampleCellRenderer<String>());
    	
    	add(lb,BorderLayout.NORTH);
		add(sp,BorderLayout.CENTER);
		
		lst.addListSelectionListener(new SampleListSelectionListener());
	}
	class SampleListSelectionListener implements ListSelectionListener{
		public void valueChanged(ListSelectionEvent e){
			JList tmp=(JList)e.getSource();
			String str = (String)tmp.getSelectedValue();
			lb.setText(str+"�Ǥ���");
		}
	}
	//���������
	class SampleCellRenderer<E> extends JLabel implements ListCellRenderer<E>{
        public void SampleCellRender(){
        	setOpaque(true);
        }
		@Override
		public Component getListCellRendererComponent(JList list, Object value, int index, boolean isSelected,
				boolean cellHasFocus) {
			// TODO Auto-generated method stub
			setText(value.toString());
			setIcon(new ImageIcon(getImage(getDocumentBase(),"Lesson5/car.jpg")));
			if(isSelected){
				setBackground(list.getBackground());
			}
			
			return this;
		}
		
	}
}
