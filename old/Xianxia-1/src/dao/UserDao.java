package dao;

import model.User;
/**
 * �û������ݿ������
 * @author Admin
 *
 */
public class UserDao {
	
	//��ŵ�ǰ�û��������ȡ
	public static User user;

	/**
	 * ����û��ġ����ݿ⡰
	 */
	private static User[] users = new User[10];
	
	/**
	 * ���ע���û�
	 * @param u
	 */
	public static void add(User u){
	
		for(int i = 0;i < users.length;i++){
			if(users[i] == null){
				users[i] = u;
				break;
			}
		}
	}
	
	/**
	 * ��ѯ�û��ķ���
	 * @param u
	 */
	public static User get(String username,String password){
	
		for(int i = 0;i < users.length;i++){
			
			User u = users[i];
			
			if(u != null){
				
				if(username.equals(u.getUsername())){
					//�����û� �˻�������
					if(password.equals(u.getPassword())){
						return u;
					}
				}
			}
		}
		
		return null;
	}

	
	
	
}
