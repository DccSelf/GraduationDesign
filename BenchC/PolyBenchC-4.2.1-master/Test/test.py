import re
import csv
filename = "1-C-CacheMiss.csv"
# 打开 CSV 文件，准备写入数据
with open(filename, mode='w', newline='') as file:
    writer = csv.writer(file)
    # 写入表头
    writer.writerow(["program","I refs","I1 misses", "LLi misses","I1 miss rate","LLi miss rate","D refs","D1 misses", "LLd misses","D1 miss rate","LLd miss rate","LL refs", "LL misses","LL miss rate"])

    # 读取程序输出文件
    with open("2mm_output.txt", "r") as output_file:
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
                print(key)
                print(value)
            print()
#            print(parts)
        # 将提取的数据写入 CSV 文件
        writer.writerow([data.get("program",""),data.get("I refs", ""), data.get("I1 misses", ""), data.get("LLi misses", ""), data.get("I1 miss rate",""),data.get("LLi miss rate",""),data.get("D refs",""), data.get("D1 misses", ""), data.get("LLd misses", ""),data.get("D1 miss rate",""),data.get("LLd miss rate",""),data.get("LL refs",""), data.get("LL misses", ""),data.get("LL miss rate","")])
