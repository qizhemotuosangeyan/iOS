//
//  ViewController.m
//  QQbyQianQian
//
//  Created by 千千 on 2019/5/2.
//  Copyright © 2019 千千. All rights reserved.
//

#import "ViewController.h"
#import "singnUpViewController.h"
#import "logining.h"
@interface ViewController () <UITextFieldDelegate>
@property UITextField * accountNumber;
@property UITextField * passwordNumber;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    //背景颜色
    //上方左侧logo
    UIImageView * logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
    logo.frame = CGRectMake(140, 150, 55, 65);
    [self.view addSubview:logo];
    //上方右侧logo
    UIImageView * logo2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo2.png"]];
    logo2.frame = CGRectMake(200, 170, 60, 30);
    [self.view addSubview:logo2];
    //账号
//    UILabel * account = [[UILabel alloc]initWithFrame:CGRectMake(60, 240, 40, 45)];
//    account.text = [NSString stringWithFormat:@"账号"];
//    [self.view addSubview:account];

    //账号框
    _accountNumber = [[UITextField alloc]initWithFrame:CGRectMake(80, 240, 240, 55)];
    _accountNumber.delegate = self;
    _accountNumber.borderStyle = UITextBorderStyleRoundedRect;
    _accountNumber.placeholder = [NSString stringWithFormat:@"QQ号"];
    _accountNumber.backgroundColor = [UIColor colorWithRed:242/255 green:243/255 blue:247/255 alpha:0.05];
    _accountNumber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_accountNumber];
    
    //账号输入监视
    [_accountNumber addTarget:self action:@selector(textField:shouldChangeCharactersInRange:replacementString:) forControlEvents:UIControlEventEditingChanged];
    [_accountNumber setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //密码
//    UILabel * password = [[UILabel alloc]initWithFrame:CGRectMake(60, 340, 40, 45)];
//    password.text = [NSString stringWithFormat:@"密码"];
//    [self.view addSubview:password];

    //密码框
    _passwordNumber = [[UITextField alloc]initWithFrame:CGRectMake(80, 320, 240, 55)];
    _passwordNumber.backgroundColor = _accountNumber.backgroundColor;
    _passwordNumber.borderStyle = UITextBorderStyleRoundedRect;
    _passwordNumber.secureTextEntry = YES;
    _passwordNumber.placeholder = [NSString stringWithFormat:@"输入密码"];
    _passwordNumber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_passwordNumber];
    //登录按钮
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(150, 440, 100, 100);
    loginButton.layer.cornerRadius = 50;
//    [loginButton setBackgroundImage:[UIImage imageNamed:@"loginButton.png"] forState:normal];
    [loginButton setImage:[UIImage imageNamed:@"loginButton.png"] forState:normal];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loginButton];
    //忘记密码
    UIButton * forgetPassword = [UIButton buttonWithType:UIButtonTypeSystem];
    forgetPassword.frame = CGRectMake(210, 800, 100, 20);
    [forgetPassword addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchDown];
   // forgetPassword.backgroundColor = [UIColor redColor];
    [forgetPassword setTitle:[NSString stringWithFormat:@"忘记密码"] forState:normal];
    [self.view addSubview:forgetPassword];
    //用户注册
    UIButton * registerAccount = [UIButton buttonWithType:UIButtonTypeSystem];
    registerAccount.frame = CGRectMake(110, 800, 100, 20);
    [registerAccount addTarget:self action:@selector(registerAccount) forControlEvents:UIControlEventTouchDown];
    // forgetPassword.backgroundColor = [UIColor redColor];
    [registerAccount setTitle:[NSString stringWithFormat:@"用户注册"] forState:normal];
    [self.view addSubview:registerAccount];
    
}

-(void)login{
    if([_accountNumber.text  isEqual: @"414772073"] && [_passwordNumber.text isEqual:@"abc123"])
    {
        logining * loginCon = [[logining alloc]init];
     //   [self presentViewController:loginCon animated:YES completion:^{
        
//            NSLog(@"切换成功");
   //     }];
        [self.navigationController pushViewController:loginCon animated:NO];
        //[self ALERT:[NSString stringWithFormat:@"登录成功"] :[NSString stringWithFormat:@"您已成功登录！"]];


    }else{
        NSLog(@"账号或密码错误");
        [self ALERT:@"登录失败" :@"账号或密码错误"];
    }
}
//-(void)alertError(UITextField*sender){
//
//        UITextField * alertText = [[UITextField alloc]initWithFrame:CGRectMake(100, 280, 60, 20)];
//        alertText.text = [NSString stringWithFormat:@"请输入正确手机号"];
//        [self.view addSubview:alertText];
//}
//代理方法：是否允许输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (!([string characterAtIndex:0] >= '0' && [string characterAtIndex:0] <= '9')){
//        UITextField * alertText = [[UITextField alloc]initWithFrame:CGRectMake(100, 280,260, 20)];
//        alertText.text = [NSString stringWithFormat:@"请输入正确QQ号/手机号"];
//        [self.view addSubview:alertText];
        return NO;
    }else{
        
        return YES;
    }
}
//实例方法弹窗警告
-(void)ALERT:(NSString *)title:(NSString * )message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:OKAction];
    [self presentViewController:alert animated:YES completion:nil];

}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
//注册
-(void)registerAccount{
    singnUpViewController * registerCon = [[singnUpViewController alloc]init];
    [self.navigationController pushViewController:registerCon animated:YES];

}
@end
