package helloworld;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class DVDdo {
	// DVD��ѯ
	public static void search() {
		System.out.println("���      ״̬              ����        �������");
		for (int i = 0; i < 50; i++) {
			if (DVDset.name[i] == null)
				continue;
			System.out.println((i + 1) + "          " + DVDset.name[i] + "        " + DVDset.state[i] + "        "
					+ DVDset.date[i] + "          ");

		}
	}

	// ����
	public static void add() {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("������DVD����");
			String line = reader.readLine();
			for (int i = 0; i < DVDset.name.length; i++) {
				if (DVDset.name[i] == null) {
					Arrays.fill(DVDset.name, i, i + 1, line);
					Arrays.fill(DVDset.state, i, i + 1, "�ڿ�");
					Arrays.fill(DVDset.date, i, i + 1, null);
					break;
				}
			}
			System.out.println("���һ����Ϣ���");
		} catch (IOException e) {
			System.out.println(e);
		}
	}

	// ɾ�����޷����У�
	public static void delete() {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		try {// ��Ԫ���滻Ϊnull
			System.out.println("������Ҫɾ��DVD���");
			String line = reader.readLine();
			// int l=Integer.parseInt(line) ;
			// Arrays.sort(DVDset.name);
			int index = Arrays.binarySearch(DVDset.name, line);
			Arrays.fill(DVDset.name, index, index + 1, null);
		} catch (IOException e) {
			System.out.println(e);
		}
		// ������һ��Ԫ���滻��ǰһ��nullԪ�ص�λ��
		for (int i = 1; i < DVDset.name.length; i++) {
			for (int j = 0; j < DVDset.name.length - i; j++) {
				if (DVDset.name[j] == null) {
					DVDset.name[j] = DVDset.name[j + 1];
				}
			}
		}
		System.out.println("ɾ��DVD��Ϣ���");
	}

	// ��� ������
	public static void lend() {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("������Ҫ�����DVD����");
			String line = reader.readLine();
			
	for (int i = 0; i < DVDset.name.length; i++) {
				String n = DVDset.name[i];
				String n2 =DVDset.name[i+1];
				String s = DVDset.state[i];
				String s2 = "�ڿ�";
				System.out.println("n="+n+"i="+i+"n2="+n2);
			  if (n.equals(line) && s.equals(s2)) {
					System.out.println("��������Ȿ��");
					DVDset.state[i] = "���";
					break;
				}
			  if (n.equals(line) && (s.equals(s2) == false)) {
					System.out.println("����DVD�Ѿ�������");
					break;
				
				}
			}
		
		} catch (

		IOException e)

		{
			System.out.println(e);
		}
	}

	// �黹
	public static void returnDVD() {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.println("������Ҫ�黹��DVD����");
			String line = reader.readLine();
			int index = Arrays.binarySearch(DVDset.name, line);
			 DVDset.state[index]="�ڿ�";
			 DVDset.date[index]=null;
			System.out.println("��黹��DVD");

		} catch (

		IOException e)

		{
			System.out.println(e);
		}
	}
}