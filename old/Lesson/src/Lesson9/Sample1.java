package Lesson9;

import java.io.File;

public class Sample1 {
 public static void main(String[] args) {
	if(args.length!=1){
		System.out.println("�ѥ��`���������`���ޤ���");
		System.exit(1);
	}
	try {
		File fl=new File(args[0]);
		System.out.println("�ե���������"+fl.getName()+"�Ǥ�");
		System.out.println("�~���ѥ���"+fl.getAbsolutePath()+"�Ǥ�");
		System.out.println("��������"+fl.length()+"�Х��ȤǤ�");
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
}
