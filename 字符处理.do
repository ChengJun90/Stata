// Stata14

//为了判断字符串var2是否有任何一个var1中的字符
gen x=0
forvalues xx=1/160{
	replace x=1 if var2==var1[`xx']
}


format title %-227s
//左对齐


// 删除空格
replace x=subinstr(x," ","",.)




// 字符长度
clear
inp str10 x
   "a;b"
   "c;d"
   "f;b;c;d"
   "w;d;c;d"
   "d;b;c"
   "s;d"
end

g y=(length(x)-length(subinstr(x,";","",.)))



如，字符型变量X，
X　　　　　　　　　　　　　Y
总经理，董事                          1
副董事长，副总经理               1
总经理，原副总经理               2
CEO                                         0
监事，副总经理                        1

g y=(length(x)-length(subinstr(x,"总经理","",.)))/9

// 注意
在stata14中不同的字符长度是不同的
测试结果如下
gen length=length(var5)
var5	length
，	3
成	3
p	1
Python	6
,	1



// 分割字符
// 关键词
// 南华;湖南
// ;海南
// 山东;中润;公司
split 关键词,parse(";")
