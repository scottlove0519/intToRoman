# intToRoman
阿拉伯数字转成罗马数字

使用Objectivee - c语言，xcode开发环境，整个过程，先分析6种条件，把个位1-10，十位10-90，百位100-900，千位1000-3000分别列出放到一个二维数组里。
创建函数，参数为Int值，返回为string，利用传入的参数分别除1000，再模除100，得到千位字符串进行字符串拼接。其它位相同。
