package helloworld;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

import javax.swing.plaf.synth.SynthSeparatorUI;

public class DVDmgr {
	//DVD��ʼ��
	public static void ini() {
		DVDset dvd = new DVDset();
		dvd.name[0] = "�������";
		dvd.state[0] = "���";
		dvd.date[0] = "7.1";

		dvd.name[1] = "�������";
		dvd.state[1] = "�ڿ�";
		dvd.date[1] = null;

		dvd.name[2] = "��������";
		dvd.state[2] = "�ڿ�";
		dvd.date[2] = null;
	}
   //�������˵�����
	public static void returnMain() {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			try {
				for (;;){
				System.out.println("����0�������˵�");
				String line = reader.readLine();
				int l=Integer.parseInt(line) ;
				if (l== 0) break;
							}
				startMenu();	
			}catch (IOException e) {
				System.out.println(e);
			}
	}

	
	
 //��ʼ�˵�
	public static void startMenu() {
		System.out.println("��ӭʹ������DVD������  ");
		System.out.println("-----------------------------------------");
		System.out.println("1.����DVD");
		System.out.println("2.�鿴DVD");
		System.out.println("3.ɾ��DVD");
		System.out.println("4.���DVD");
		System.out.println("5.�黹DVD");
		System.out.println("6.�˳�DVD");
		System.out.println("-----------------------------------------");
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		try {
			String line = reader.readLine();
			switch (line) {
			case "1":
				System.out.println("����һ��DVD");
				DVDdo.add();
				returnMain();
				break;
			case "2":
				System.out.println("�鿴����DVD");
				DVDdo.search();
				returnMain();
				break;
			//����
			case "3":
				System.out.println("ɾ��һ��DVD");
				DVDdo.delete();
				returnMain();
				break;
			case "4":
				System.out.println("���һ��DVD");
                DVDdo.lend();
				returnMain();
				break;
			case "5":
				System.out.println("�黹һ��DVD");
				DVDdo.returnDVD();
				returnMain();
				break;
			case "6":
				System.out.println("���˳���ллʹ�á�");

				returnMain();
				break;
			default:
				System.out.println("������1-6������,����0�������˵���");
				returnMain();

			}
		} catch (IOException e) {
			System.out.println(e);
		}

	}

	public DVDmgr() {
		// TODO Auto-generated constructor stub

	}

}
