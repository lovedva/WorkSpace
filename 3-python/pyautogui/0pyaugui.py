# -*- coding: UTF-8 -*- 
# 使用注意：可以使用utf8编码此文件，字符串io为utf8编码，平台Windows。
# pywinauto自动化，导出明细表到xls，太大的文件先不用这个，打开太慢了会卡操作顺序,预先打开caxa一个空文档，不然打开太慢
# 测试的时候不要用IDE，用命令行直接运行，方便快速结束
import os,sys,time,pyautogui,re
#  pyautogui.mouseInfo() 打开鼠标探针
# 变量预处理
# 保存屏幕尺寸
sizex,sizey=pyautogui.size()

# 添加明细表行数，点击1000下，坐标不固定
 #先等待5秒，手动切换到caxa软件
time.sleep(5)
 #移动鼠标到“插入”图标，点击
pyautogui.moveTo(1682,139, duration=0.1) 
pyautogui.click(clicks=1) #点击
time.sleep(0.5)

 #※移动鼠标到对应位置点击1000下，添加1000行
for i in range (0,1200):
    pyautogui.moveTo(1292,1024, duration=0.1) 
    pyautogui.click(clicks=1) #点击
    time.sleep(0.5)

# pyautogui.typewrite('tba') 
# pyautogui.press(['space'],interval=0.1) #打开数据库操作
# time.sleep(0.5)
# # os.chdir(sys.path[0])
# # loc = pyautogui.locateOnScreen("clickpics/shuchuSJEmp.jpg", region=(0, 0,sizex, sizey) ) # region参数限制查找范围，加快查找速度
# # print (loc)

# #点击数据库路径
# pyautogui.moveTo(1576,669, duration=0.1) 
# pyautogui.click(clicks=1) 
# time.sleep(0.5)
# #选择文件名文本框
# pyautogui.moveTo(916,1019, duration=0.1) 
# pyautogui.click(clicks=1) 
# time.sleep(0.5)
# #键入文件名
# pyautogui.typewrite(AssemNum) #不支持中文，重复图号需要手动处理
# time.sleep(0.5)
# # 点击打开
# pyautogui.press(['enter'], interval=0.1)
# time.sleep(0.5)
# #点击数据库表名
# pyautogui.moveTo(1264,715, duration=0.1) 
# pyautogui.click(clicks=1) 
# time.sleep(0.5)
# #键入表名
# # pyautogui.typewrite("Sheet")
# pyautogui.typewrite(['S','h','e','e','t','0','1'], interval=0.1) 
# pyautogui.moveTo(1504,548, duration=0.1) # 移动鼠标到读入数据
# pyautogui.click(clicks=1) #点击
# pyautogui.moveTo(1289,550, duration=0.1) # 移动鼠标到读出数据 1289,550 读入数据 1504,548
# pyautogui.click(clicks=1) #点击
# time.sleep(0.5)
# #点击执行 1503,809
# pyautogui.moveTo(1503,809, duration=0.1) # 移动鼠标到读出数据 1289,550 读入数据 1504,548
# pyautogui.click(clicks=1) #点击
# time.sleep(0.5)
# #点击OK确定，按空格
# pyautogui.press(['space'], interval=0.1)
# time.sleep(1)
# #按键盘Alt+C取消数据库操作对话框 
# pyautogui.hotkey('alt', 'c')
# time.sleep(0.5)
# pyautogui.moveTo(1282,786, duration=0.1) # 移动鼠标到画布中间点一下
# pyautogui.click(clicks=1) #点击
time.sleep(1)
# #按键盘Crl+w退出当前exb文档
# pyautogui.hotkey('Ctrl', 'w')
# time.sleep(0.5)
        
                        
                           
    # for name in dirs:
    #     print(os.path.join(root, name)) 

# for item in txt_tables:
#     file = open(item)
#     print ("打开"+item)

print ("python over") 