clear
set seed 100
set obs 68
gen x = int(rnormal(16, 2))
gen r=runiform(12,20)  //均匀分布
help random_number_functions  //更多的随机函数


clear
set seed 1000
set obs 200000
gen r=uniform()  //均匀分布
su r,de
gen i=r(mean)
gen y1=0
replace y1=1 if r>i
replace r=uniform()  //均匀分布
su r,de
replace i=r(mean)
gen y2=0
replace y2=1 if r>i
gen x1=uniform()*10+200
gen x2=uniform()*uniform()
gen x3 = rnormal(0.004, 0.02)
biprobit y1 y2 x1 x2 x3


// 用回归来寻求关系
clear
set seed 100
set obs 68
gen x = int(rnormal(16, 2))
gen x1 = int(rnormal(16, 2))
gen x2=x-x1
gen e = int(rnormal(0.5, 2))
gen y=2+0.8*x+e
reg y x
reg y x1 x2


// 为什么要分组？
clear
set seed 1000
set obs 1000
gen x1 = int(rnormal(500, 123))
replace x1=1 if x1<1
gen x2 = int(rnormal(600, 216))
replace x2=1 if x2<1
gen x3=x1+x2
replace x1=ln(x1)
replace x2=ln(x2)
replace x3=ln(x3)
su x*


// 分析师模拟数据，取中位数
// 模拟数据
clear
set seed 1000
set obs 1200
gen stkcd=_n
gen ana2013=int(rnormal(50, 25))
gen ana2014=int(rnormal(50, 25))
gen ana2015=int(rnormal(50, 25))
reshape long ana,i(stkcd) j(year)
save data.dta,replace
append using data
append using data
append using data
append using data
append using data
append using data
append using data
gen roa =(rnormal(100, 123))
sort stkcd year
replace ana=int(rnormal(50, 25))
erase data.dta
// 计算
bysort stkcd year:egen M_roa=median(roa)
// duplicates drop stkcd year,force
// 偶数问题？
bysort stkcd year:gen x=_N
tab x
