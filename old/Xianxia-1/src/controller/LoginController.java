package controller;

import model.User;
import dao.UserDao;
import view.LoginView;
import view.RegisterView;

/**
 * ��¼�Ĳ���
 * @author Admin
 *
 */
public class LoginController extends BaseController {
	
	public static void login(){
		
		LoginView.show1();
		
		//iuput ���� ͨ�� �̳� basecontroller �� ���
		String username  = input.next();
		
		LoginView.show2();
		
		String password  = input.next();
		
		//�������û������Ҫȥ���ݲֿ⣨dao���У������ȴ�ŵ��˺����� ���в�ѯ
		
		User user = UserDao.get(username, password);
		
		//��¼��ʱ������û�������˺����� ���������ݿ��д��ڣ�����������ȷ����ô��������û�����
		if(user != null){
			//��ʼ����¼���������뵽��Ϸ��ҳ��]
			
			//�ѵ�½����û���Ϣ�����뵽����������Է��ʵ���ȫ�ֱ���
			UserDao.user = user;
			
			CenterController.show();
		}else{
			//�˺�������󣬷��ػ�ӭ����
		}
		
	}
}
