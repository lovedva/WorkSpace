package controller;

import java.util.Random;
import java.util.Scanner;

import view.LoginView;
import view.WelcomeView;


/**
 * ��Ϸ��ʼ����
 * @author Admin
 *
 */
public class StartGame extends BaseController{

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//��ӡ��ӭ����
		
		while(true){
			
			WelcomeView.show();
			
			String s = input.next();
			if(s.equalsIgnoreCase("1")){
				//���õ�½����
				LoginController.login();
			}else if(s.equalsIgnoreCase("2")){
				//����ע�᷽��
				RegisterController.register();
				
			}else{
				System.out.println("ѡ����󣬳������");
			}
		}

	}

}
