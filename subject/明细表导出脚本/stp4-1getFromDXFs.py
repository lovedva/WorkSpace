#!/usr/bin/python
# -*- coding: UTF-8 -*- 
# 从dxf文件里捕获所需信息，图幅尺寸
# 引入包
import ezdxf,os,sys,re,json,time
from ezdxf import bbox
#-----------------变量处理----------------------------------
# 文件名
logFName=os.getcwd()+r"\stp7getFromDXFs_py.log"
inputFName=os.getcwd()+r"\pcpNo.json"
inputPath=0 
outputFName=0
outputPath=0
# 屠夫尺寸大小
#获取PaperSize（dxflimits）
pSizeA4=(210.0, 297.0, 0.0)
pSizeA3=(420.0, 297.0, 0.0)
pSizeA2=(594.0, 420.0, 0.0)
pSizeA1=(841.0, 594.0, 0.0)
pSizeA0=(1189.0, 841.0, 0.0)


def main():
    print_log=open(logFName,"w")
    jsonObj = json.load(open(inputFName))
    # print (jsonObj)
    fNameArryAll=jsonObj["fnArrAll"]
    tempCount=0
    allDXFJsonArry=[{"手动检查修改":"False","内容":"1总图图幅"}] #dxfjson数组，总数组
    allSizeDict={"A184-0-0":"手动查询","A184-1-0":"手动查询"} #屠夫字典对象
    allSizeDictCount={"图幅计算处理dxf数量":0}
    allDXFJsonArry.append(allSizeDict)
    allDXFJsonArry.append(allSizeDictCount)
    # 1)遍历全部图号数组，对于每个文件名——
    for i in range(0,len(fNameArryAll)):
        prtNumAll=fNameArryAll[i]
        # 2)迭代获取当前路径下所有dxf文件——    
        for root, dirs, files in os.walk(sys.path[0], topdown=False):
            for name in files:
                fPath=str(os.path.join(root, name))
                # print (fPath)
                # print (assemNum)
                tempStr=prtNumAll+" "
                regxObj = re.search(tempStr, name)
                if regxObj: #如果正则匹配包含指定图号（装配和子零件图号）
                    if name.__contains__(".dxf"): # 3)判断提取包含数组当前文件名的dxf文件
                        print (prtNumAll)
                        print (fPath)
                        startTime=time.time()
                        # 4)dxf操作
                        doc = ezdxf.readfile(fPath,"utf-8") #按文件名获取文件实例，需要R2007或以后版本

                        psp = doc.layout("model")  #dxflimits尺寸范围，计算图幅：https://ezdxf.readthedocs.io/en/stable/concepts/extents_limits.html#:~:text=The%20limits%20of%20the%20modelspace%20are%20stored%20in,copies%20of%20the%20Layout%20attributes%20Layout.dxf.extmin%20and%20Layout.dxf.extmax. 
                        pSize3D=psp.dxf.limmax-psp.dxf.limmin #按Layout键值获取paperspace实例，Caxa中显示“模型”键值为model，不存在键值的例如Layout3会报错，caxa转出的dxf未测试
                        print(pSize3D)
                        if pSize3D==pSizeA4:
                            allSizeDict[prtNumAll]="A4" #※ 插入总图图幅字典对象 
                        elif pSize3D==pSizeA3:
                            allSizeDict[prtNumAll]="A3"
                        elif pSize3D==pSizeA2:
                            allSizeDict[prtNumAll]="A2"
                        elif pSize3D==pSizeA1:
                            allSizeDict[prtNumAll]="A1"
                        elif pSize3D==pSizeA0:
                            allSizeDict[prtNumAll]="A0"
                        else:
                            allSizeDict[prtNumAll]="非常规需手动查看"
                            print("屠夫非常规需手动查看：",prtNumAll,file=print_log)
                        tempCount=tempCount+1
                        endTime=time.time()
                        dtime = endTime-startTime
                        print("dxf处理时间：%.8s s" % dtime)  #显示到微秒 
                        if dtime > 1.5:
                            print("大于1.5s的dxf文件名："+name+" 处理时间：%.8s" % dtime,file=print_log)
                        # 根据不同规则Query实体
                        #  查找“数量”文字
                        # if ("-0" in assemNum): #捕获有问题，多重捕获会失败，后面改成直接从装配数组读取
                        #     print ("进入文件名捕获-0")
                        #     tempCount=tempCount+1
                        #     assemCountdict[assemNum]="未查捕获到数量"
                        #     print("装配图号："+assemNum)
                        #     txtCount = msp.query("MTEXT")
                        #     for e in txtCount:
                        #         if e.text.__contains__("数量"): #获取标题栏作为属性的数量数值见（未完成）https://ezdxf.readthedocs.io/en/stable/blocks/insert.html
                                    
                        #             assemCountdict[assemNum]=e.text.replace(r"\T1.1;数量：","") #※ 插入总图数量字典对象
                        #             print (e.text)
                # else:#如果正则匹配图号没有找到，输出图号到log
                #     print ("正则匹配图号没有找到匹配的文件名，图号："+prtNumAll,file=print_log)
                

    # print (assemCountdict)
    allSizeDictCount["图幅计算处理dxf数量"]=tempCount
    jsontext = json.dumps(allDXFJsonArry,ensure_ascii=False)
    jsontext=re.sub(r",",",\n",jsontext)
    with open(os.getcwd()+r"\allDXFData.json","w") as f:
        f.write(jsontext) 
    print ("获取数量一共处理了"+str(tempCount)+"个文件",file=print_log)
    print_log.close()

if __name__ == "__main__":  # 用作主程序时执行
    print ('This is main of module')
    main()
    # print ("打开"+outputfile)
    # os.startfile(r'.\output\%s' %(outputfile)) 
    print ("python over")
    
    
    
    

    
    
    
#---------------测试用\备用代码-------------------------------------------

    # # helper function  打印所有线条
    # def print_entity(e):
    #     print("LINE on layer: %s\n" % e.dxf.layer)
    #     print("start point: %s\n" % e.dxf.start)
    #     print("end point: %s\n" % e.dxf.end)

    # # iterate over all entities in modelspace
    # for e in msp:
    #     if e.dxftype() == "LINE":
    #         print_entity(e)

    # # entity query for all LINE entities in modelspace
    # for e in msp.query("LINE"):
    #     print_entity(e)
# chicun = msp.query('DIMENSION[color==3]')
#     for e in chicun:
#         # print (e.dxfattribs().items()) #获取所有可以使用的dxf属性attribute
#         # print (e.get_dxf_attrib("color")) #打印颜色索引，绿色3
#         e.set_dxf_attrib("layer","尺寸线层")

# Reference: 
# https://ezdxf.readthedocs.io/en/stable/tutorials/layers.html
# https://ezdxf.readthedocs.io/en/stable/dxfentities/dxfgfx.html#common-graphical-dxf-attributes  图层颜色，线型，粗细，缺省设置
# https://ezdxf.readthedocs.io/en/stable/query.html#entity-query-string  Query查找实体方法 
# https://ezdxf.readthedocs.io/en/stable/query.html
# https://ezdxf.readthedocs.io/en/stable/dxfentities/hatch.html 所有dxf对象