package view;

import model.UserInfo;
import dao.UserDao;


public class UserInfoView {
	
	public static void show(){
		
		UserInfo ren = UserDao.user.getUserInfo();
		
		System.out.println(" �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��");
		System.out.println(" ��");
		System.out.println(" ��\t\t\t\t��� ��"+ren.getName()+"�� ������Ϣ��");
		System.out.println(" ��");
		System.out.println(" �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��");
		System.out.println(" �� ��Ϸ����"+ren.getName()+"");
		System.out.println(" �� Ѫ  ����"+ren.getBlood()+"");
		System.out.println(" �� ���ڵ�ͼ�� ��"+ren.getMap().getName()+"��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" ��");
		System.out.println(" �� ���� ����� ���أ�");
		System.out.println(" �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��");
		
	}
}
