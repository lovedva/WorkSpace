#!/usr/bin/python
# -*- coding: UTF-8 -*- 
import pyautogui,os,time,cv2

filename=os.getcwd()+r"\1.jpg"
filename2=os.getcwd()+r"\my_screenshot.png"

if __name__ == "__main__":  # 用作主程序时执行
    print ('This is main of module')
    sizex,sizey=pyautogui.size()
    pyautogui.moveTo(sizex/2,sizey/2,duration=0.1)
    pyautogui.moveRel(100, -200, duration=0.1)

    # pyautogui.click(filename) 

    # 屏幕截图
    pyautogui.screenshot('screenshot.png')
    # 载入截图
    img=cv2.imread('screenshot.png')
    # 图像模板
    img_1=cv2.imread('1.jpg')
    # 读取模板的宽度和高度
    height,width= img_terminal.shape
    # 进行模板匹配
    result = cv2.matchTemplate(img,img_1,cv2.TM_SQDIFF_NORMED)
    # 解析出匹配区域左上坐标