*时间数据的处理
*这个方法是STATA官方PDF文件中
*datetime translation — String to numeric date translation functions
*var1，string，2012-12-30
gen shijian1=date( var1 ,"YMD")
gen shijian2=date( var1 ,"YMD")
format shijian1 %td
format shijian2 %td
gen tianshu= shijian1- shijian2
br
