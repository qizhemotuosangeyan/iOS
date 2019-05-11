//
//  verifyNumber.m
//  QQbyQianQian
//
//  Created by 千千 on 2019/5/4.
//  Copyright © 2019 千千. All rights reserved.
//

#import "verifyNumber.h"

@interface verifyNumber ()
@property UITextField * verifyNumber;
@end

@implementation verifyNumber

- (void)viewDidLoad {
    [super viewDidLoad];
    //输入验证码提示文本
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel* InputverifyNumber = [[UILabel alloc]initWithFrame:CGRectMake(30, 120, 350, 50)];
    [InputverifyNumber setText:@"输入验证码"];
    [self.view addSubview:InputverifyNumber];
    [InputverifyNumber setFont:[UIFont fontWithName:@"Arial" size:35]];
    //验证码输入框 x+90,Y+40
    _verifyNumber = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 220, 55)];
    //    _phoneNumber.delegate = self;
    _verifyNumber.borderStyle = UITextBorderStyleNone;
    [_verifyNumber setFont:[UIFont fontWithName:@"Arial" size:25]];
    [self.view addSubview:_verifyNumber];
    //输入框下面的下划线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20,250,345,2)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    //验证码输入监视
    [_verifyNumber addTarget:self action:@selector(textField:shouldChangeCharactersInRange:replacementString:) forControlEvents:UIControlEventEditingChanged];
    [_verifyNumber setAutocapitalizationType:UITextAutocapitalizationTypeNone];
}
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(_verifyNumber.text.length ==4)
    {
        if([_verifyNumber.text isEqual:@"1234"])
        {

            //验证成功返回登陆界面
            ViewController * viewCon = [[ViewController alloc]init];

            //隐藏back方法
//            [viewCon.navigationController.navigationItem setHidesBackButton:YES];
//            [self.navigationItem setHidesBackButton:YES];
//             [viewCon.navigationController.navigationBar.backItem setHidesBackButton:YES];
//

            viewCon.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:viewCon animated:NO];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"您已经注册成功，即将返回登陆界面" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:OKAction];
            [self presentViewController:alert animated:YES completion:nil];

            

        }
        else{
            //验证失败请重新输入
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证码错误" message:@"注册失败，请检查您的验证码" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:OKAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
}
//-(void)ALERT:(NSString *)title:(NSString * )message{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    [alert addAction:OKAction];
//    [self presentViewController:alert animated:YES completion:nil];
//
   }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
