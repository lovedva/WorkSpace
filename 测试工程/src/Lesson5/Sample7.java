package Lesson5;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Sample7 extends JApplet {
   private JLabel lb;
   private JMenuBar mb;
   private JMenu[] mn = new JMenu[4];
   private JMenuItem[] mi = new JMenuItem[6];
   public void init(){
	   lb = new JLabel("����ä��㤤�ޤ�");
	   mb = new JMenuBar();
	   
	   mn[0]=new JMenu("�ᥤ��");
	   mn[1]=new JMenu("�ᥤ��2");
	   mn[2]=new JMenu("���֣�");
	   mn[3]=new JMenu("���֣�");
	   
	   mi[0]=new JMenuItem("�\��܇");
	   mi[1]=new JMenuItem("�ȥ�å�");
	   mi[2]=new JMenuItem("���`�ץ󥫩`");
	   mi[3]=new JMenuItem("�������`");
	   mi[4]=new JMenuItem("���ݩ`�ĥ��`");
	   mi[5]=new JMenuItem("�ߥ˥��`");
	   
	   mn[0].add(mi[0]);
	   mn[0].add(mi[1]);
	   mn[1].add(mi[2]);
	   mn[1].add(mi[3]);
	   mn[3].add(mi[4]);
	   mn[3].add(mi[5]);
	   
	   mn[1].add(mn[2]);
	   mn[1].addSeparator();
	   mn[1].add(mn[3]);
	   
	   mb.add(mn[0]);
	   mb.add(mn[1]);
	   
	   mb.add(mn[0]);
	   mb.add(mn[1]);
	   
	   add(mb,BorderLayout.NORTH);
	   add(lb,BorderLayout.CENTER);
	   
	   for(int i=0;i<mi.length;i++){
		   mi[i].addActionListener(new SampleActionListener());
	   }
   }
    class SampleActionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			// TODO Auto-generated method stub
			JMenuItem tmp=(JMenuItem)e.getSource();
			String str = tmp.getText();
			lb.setText(str+"�Ǥ���");
		}
    }
}
