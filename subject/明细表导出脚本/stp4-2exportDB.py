# -*- coding: UTF-8 -*- 
# 使用注意：可以使用utf8编码此文件，字符串io为utf8编码，平台Windows。
# pywinauto自动化在exb目录执行，导出明细表到xls，太大的文件先不用这个，打开太慢了会卡操作顺序,预先打开caxa一个空文档，不然打开太慢
# 测试的时候不要用IDE，用命令行直接运行，方便快速结束
import os,sys,time,pyautogui,re,json
#-----------------变量处理----------------------------------
# 文件名
logFName=os.getcwd()+r"\stp4-2exportDB_py.log"
inputFName=os.getcwd()+r"\pcpNo.json"
inputPath=0 
outputFName=0
outputPath=0

#  pyautogui.mouseInfo() 打开鼠标探针
# 变量预处理
print_log=open(logFName,"w")
jsonObj = json.load(open(inputFName))
fNameArryAssem=jsonObj["fnArrAssem"]

# 保存屏幕尺寸
sizex,sizey=pyautogui.size()

dbCounts=0
for i in range(0,len(fNameArryAssem)):
    AssemNum= fNameArryAssem[i]
# 获取当前路径下所有exb文件，并且打开。tba 
    for root, dirs, files in os.walk(sys.path[0], topdown=False):
        for name in files:
            if name.__contains__(".exb") and name.__contains__(AssemNum): #判断包含装配（-0）图号的文件名
                fPath=str(os.path.join(root, name))
                # print(fPath)
                print(name)
                dbCounts=dbCounts+1
                reName= re.sub(r'[\u4e00-\u9fa5]', "", name)
                reName=re.sub(r'[()（） ]', "", reName).replace(".exb","")
                # print (reName)
                flag=1 #flag为1就导出数据库 不导出只计数，把这个数字改成3，输出文件夹不放xls文件
                for root2, dirs2, files2 in os.walk("D:\Erica'J\Documents", topdown=False):  #遍历查重document下的文件，如果相同就不导出了
                    for name2 in files2:
                        if name2.__contains__(".xls"):
                            print("name2:"+name2)
                            if reName.__contains__(name2.replace(".xls","")):
                                flag=0
                                break
                            else:
                                flag=1 
                if flag==1:
                    os.startfile(fPath) 

                    time.sleep(1.5)
                    pyautogui.typewrite('tba') 
                    pyautogui.press(['space'],interval=0.1) #打开数据库操作
                    time.sleep(0.5)
                    # os.chdir(sys.path[0])
                    # loc = pyautogui.locateOnScreen("clickpics/shuchuSJEmp.jpg", region=(0, 0,sizex, sizey) ) # region参数限制查找范围，加快查找速度
                    # print (loc)
                    pyautogui.moveTo(1289,550, duration=0.1) # 移动鼠标到读出数据 1289,550 读入数据 1504,548
                    pyautogui.click(clicks=1) #点击
                    time.sleep(0.5)
                    #点击数据库路径
                    pyautogui.moveTo(1576,669, duration=0.1) 
                    pyautogui.click(clicks=1) 
                    time.sleep(0.5)
                    #选择文件名文本框
                    pyautogui.moveTo(916,1019, duration=0.1) 
                    pyautogui.click(clicks=1) 
                    time.sleep(0.5)
                    #键入文件名
                    pyautogui.typewrite(AssemNum) #不支持中文，重复图号需要手动处理
                    time.sleep(0.5)
                    # 点击打开
                    pyautogui.press(['enter'], interval=0.1)
                    time.sleep(0.5)
                    #点击数据库表名
                    pyautogui.moveTo(1264,715, duration=0.1) 
                    pyautogui.click(clicks=1) 
                    time.sleep(0.5)
                    #键入表名
                    # pyautogui.typewrite("Sheet")
                    pyautogui.typewrite(['S','h','e','e','t','0','1'], interval=0.1) 
                    pyautogui.moveTo(1504,548, duration=0.1) # 移动鼠标到读入数据
                    pyautogui.click(clicks=1) #点击
                    pyautogui.moveTo(1289,550, duration=0.1) # 移动鼠标到读出数据 1289,550 读入数据 1504,548
                    pyautogui.click(clicks=1) #点击
                    time.sleep(0.5)
                    #点击执行 1503,809
                    pyautogui.moveTo(1503,809, duration=0.1) # 移动鼠标到读出数据 1289,550 读入数据 1504,548
                    pyautogui.click(clicks=1) #点击
                    time.sleep(0.5)
                    #点击OK确定，按空格
                    pyautogui.press(['space'], interval=0.1)
                    time.sleep(1)
                    #按键盘Alt+C取消数据库操作对话框 
                    pyautogui.hotkey('alt', 'c')
                    time.sleep(0.5)
                    pyautogui.moveTo(1282,786, duration=0.1) # 移动鼠标到画布中间点一下
                    pyautogui.click(clicks=1) #点击
                    time.sleep(1)
                    # #按键盘Crl+w退出当前exb文档
                    # pyautogui.hotkey('Ctrl', 'w')
                    # time.sleep(0.5)
                            

print ("导出的xls数据库数量："+str(dbCounts)+"注意检查数量缺漏，完毕后把过大图号放回数组")
print ("导出的xls数据库数量："+str(dbCounts)+"注意检查数量缺漏，完毕后把过大图号放回数组",file=print_log)
print_log.close()

print ("python over") 