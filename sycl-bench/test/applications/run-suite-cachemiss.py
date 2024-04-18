import subprocess
import csv
import re
import os

programs = ["arith","2mm", "2Dconvolution", "fdtd2d", "gesummv", "mvt", "3mm", "atax", "bicg", "3Dconvolution", "correlation", "covariance", "gemm", "gramschmidt", "syr2k", "syrk"]
Problem_Size = {"arith":1048576,"2mm":1024,"2Dconvolution":4096,"fdtd2d":1024,"gesummv":16384,"mvt":16384,"3mm":1024,"atax":4096,"bicg":16384,"3Dconvolution":1024,"correlation":1024,"covariance":1024,"gemm":1024,"gramschmidt":1024,"syr2k":1024,"syrk":1024} 
filename = "1-SYCL-CacheMiss.csv"

# 打开 CSV 文件，准备写入数据
with open(filename, mode='w', newline='') as file:
    writer = csv.writer(file)
    # 写入表头
    writer.writerow(["program","I refs","I1 misses", "LLi misses","I1 miss rate","LLi miss rate","D refs","D1 misses", "LLd misses","D1 miss rate","LLd miss rate","LL refs", "LL misses","LL miss rate"])
    num = -1
    for program in programs:
        # 执行 Valgrind 命令
        num += 1
        if os.path.exists(f"{program}_output.txt"):
            os.remove(f"{program}_output.txt")
        #--size= --num-runs=1
        command = f"valgrind --tool=cachegrind ./{program} --size={Problem_Size[program]}  --num-runs=1 > {program}_output.txt 2>&1"
        subprocess.run(command, shell=True)

        # 读取程序输出文件
        with open(f"{program}_output.txt", "r") as output_file:
            lines = output_file.readlines()
            # 从输出文件中提取数据
        data = {}
        for line in lines:
            parts = line.strip().split(":")
            if len(parts) == 2:
                key, value = parts
                # 去除 key 中的 "==数字=="
                key = re.sub(r'==\d+==', ' ', key)
                key = re.sub(r'\s+',' ',key)
                key = key.strip()
                # 去除 value 中的空格
                value = value.strip().replace(" ", "")
                data[key] = value
                #print(key)
                #print(value)
            #print()
        # 将提取的数据写入 CSV 文件
        writer.writerow([program,data.get("I refs", ""), data.get("I1 misses", ""), data.get("LLi misses", ""), data.get("I1 miss rate",""),data.get("LLi miss rate",""),data.get("D refs",""), data.get("D1 misses", ""), data.get("LLd misses", ""),data.get("D1 miss rate",""),data.get("LLd miss rate",""),data.get("LL refs",""), data.get("LL misses", ""),data.get("LL miss rate","")])
        print(f"{program}  OK!!!")

