//
//  ViewController.m
//  DoMani_test
//
//  Created by 邱中卫 on 2019/6/14.
//  Copyright © 2019 qiuzhongwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton    *btn;
@property (nonatomic, strong) UILabel     *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
   
    int result = romanToInt(@"IV");
}
NSString* intToRoman(int num) {
    // table表存储十进制数上每个位所表示的罗马数字
    // 例如， 365 中 百位上的 3 大小为 table[2][3] = CCC
    // 因为罗马数字没有0 ，所e以第一位放占位符。
    NSArray *table = @[
        @[@"", @"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", @"VIII", @"IX"],
        @[@"", @"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX", @"LXXX", @"XC"],
        @[@"", @"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC", @"DCCC", @"CM"],
        @[@"", @"M", @"MM", @"MMM", @"", @"", @"", @"", @"", @""]
        ];

    NSString *roman_numeral = @"";

    roman_numeral = [roman_numeral stringByAppendingString:table[3][num / 1000]];
    
    num %= 1000;
    roman_numeral = [roman_numeral stringByAppendingString:table[2][num / 100]];;

    num %= 100;
    roman_numeral = [roman_numeral stringByAppendingString:table[1][num / 10]];;

    num %= 10;
    roman_numeral = [roman_numeral stringByAppendingString:table[0][num]];;

    return roman_numeral ;
}
int romanToInt(NSString *s) {
    NSDictionary *mymap = @{@"I":@"1",
                            @"V":@"5",
                            @"X":@"10",
                            @"L":@"50",
                            @"C":@"100",
                            @"D":@"500",
                            @"M":@"1000"};
    int result = 0,temp = 0;
    for (int i = 0; i < s.length - 1; i++) {
        temp = [mymap[[s substringWithRange:NSMakeRange(i, 1)]] intValue];
        if (temp < [mymap[[s substringWithRange:NSMakeRange(i + 1, 1)]] intValue]) {
            result -= temp;
        } else {
            result += temp;
        }
    }
    result += [mymap[[s substringWithRange:NSMakeRange(s.length - 1, 1)]] intValue];
    return result;
}
- (void)btnClick:(UIButton*)sender {
     NSString *string = intToRoman([self.textField.text intValue]);
    self.label.text = string;
    if ([self.textField.text intValue] > 3999) {
        self.label.text = @"数值最大不能超过4000";
    }
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(100/2, 100, self.view.frame.size.width - 100, 40)];
        _textField.placeholder = @"请输入数字，0-3000之间的数字";
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.borderStyle = UITextBorderStyleLine;
        _textField.layer.borderColor = [UIColor grayColor].CGColor;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _textField;
}
- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:0];
        _btn.frame = CGRectMake(self.label.frame.origin.x , self.label.frame.origin.y + self.label.frame.size.height + 50, self.label.frame.size.width, 40);
        [_btn setTitle:@"确定" forState:0];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitleColor:[UIColor whiteColor] forState:0];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(self.textField.frame.origin.x , self.textField.frame.origin.y + self.textField.frame.size.height + 50, self.textField.frame.size.width, 40)];
        _label.font = [UIFont boldSystemFontOfSize:17.0f];
    }
    return _label;
}
@end
