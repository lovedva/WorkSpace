package model;

import view.MapView;
import view.MeanView;
import dao.UserDao;

public class Map {
	/**
	 * ��ʾΧǽ
	 */
	public static final String WALL = "1";
	
	/**
	 * ��ʾ�յ�
	 */
	public static final String UNUSED = "0";
	
	/**
	 * ��ʾ�û�
	 */
	public static final String USER = " ��";
	
	private String[][] data = new String[25][40];
	
	private String name;
	
	public Map(String name){
		this.name = name;
		init();
	} 


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	//��ʼ��һ���հ׵�ͼ
	private void init(){
		
		for (int i = 0; i <25; i++) {
			
			for (int j = 0; j < 40; j++) {
					
				      if(j==0 || i==0 || i==24 || j==39){
				    	  data[i][j] = WALL; 
				    		  
				      }else{
				    	  data[i][j] = UNUSED;//��ʾ�յ�
				      }
			}
		}
	}
	
	/**
	 * ��ӡ��ǰ��ͼ���������
	 * ������ʾ�ɵ�ͼ
	 */
	public void show(){
		
		for (int i = 0; i <25; i++) {
			
			for (int j = 0; j < 40; j++) {
				if(data[i][j].equalsIgnoreCase(WALL)){
					System.out.print(" ��");
				}
				else if(data[i][j].equalsIgnoreCase(UNUSED)){
					System.out.print("  ");
				}
				else{
					System.out.print(data[i][j]);
				}
				
			}
			System.out.println("");
		}
	}
	
	/**
	 * ִ���ƶ������ķ���
	 */
	public void execute(int y ,int x,String direction){	

		switch (direction) {
			case "w":
					data[y][x] = USER;
					data[++y][x] = UNUSED;
				break;
			case "s":
				data[y][x] = USER;
				data[--y][x] = UNUSED;
				break;
			case "a":
				data[y][x] = USER;
				data[y][++x] = UNUSED;
				break;
			case "d":
				data[y][x] = USER;
				data[y][--x] = UNUSED;
				break;
	
			default:
				break;
		}

	}


	public String[][] getData() {
		return data;
	}


	public void setData(String[][] data) {
		this.data = data;
	}
	
	public void setUser(int y,int x){
		data[y][x] = USER;  
	}
	
}
