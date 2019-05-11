//
//  singnUpViewController.m
//  QQbyQianQian
//
//  Created by 千千 on 2019/5/3.
//  Copyright © 2019 千千. All rights reserved.
//

#import "singnUpViewController.h"

@interface singnUpViewController ()
@property UITextField *phoneNumber;
@property UIButton * nextStep;
@property NSArray * place;//手机地区前缀
@end

@implementation singnUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //输入手机号码提示文本
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel* InputThePhoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(30, 120, 350, 50)];
    [InputThePhoneNumber setText:@"输入手机号码"];
    [self.view addSubview:InputThePhoneNumber];
    [InputThePhoneNumber setFont:[UIFont fontWithName:@"Arial" size:35]];
    //同意协议条款提示文本
    UILabel* agreeProtocol = [[UILabel alloc]initWithFrame:CGRectMake(30, 170, 350, 20)];
    [agreeProtocol setText:@"注册即代表阅读并同意使用条款和隐私政策"];
    agreeProtocol.textColor = [UIColor colorWithRed:242/255 green:243/255 blue:247/255 alpha:0.5];
    [self.view addSubview:agreeProtocol];
    [agreeProtocol setFont:[UIFont fontWithName:@"Arial" size:15]];
    //手机号码输入框 x+90,Y+40
    _phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 220, 55)];
//    _phoneNumber.delegate = self;
    _phoneNumber.borderStyle = UITextBorderStyleNone;
    [_phoneNumber setFont:[UIFont fontWithName:@"Arial" size:25]];
//    _phoneNumber.placeholder = [NSString stringWithFormat:@"QQ号"];
//    _phoneNumber.backgroundColor = [UIColor colorWithRed:242/255 green:243/255 blue:247/255 alpha:0.1];
//    _phoneNumber.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_phoneNumber];
    //输入框下面的下划线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(20,250,345,2)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    //下一步按钮
    _nextStep = [[UIButton alloc]initWithFrame:CGRectMake(20, 260, 345, 45)];
    [self.view addSubview:_nextStep];
    _nextStep.backgroundColor = [UIColor lightGrayColor];
    [_nextStep setTitle:@"获取验证码" forState:UIControlStateDisabled];
    [_nextStep setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_nextStep setBackgroundImage:[UIImage imageNamed:@"grayColor.png"] forState:UIControlStateDisabled];
    [_nextStep setBackgroundImage:[UIImage imageNamed:@"blueColor.png"] forState:UIControlStateNormal];
    [_nextStep addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
    //监视手机号码输入框
    [_phoneNumber addTarget:self action:@selector(textField:shouldChangeCharactersInRange:replacementString:) forControlEvents:UIControlEventEditingChanged];
    _nextStep.enabled = NO;
    //选择手机号地区
    
    UIPickerView * placeForPhone = [[UIPickerView alloc]initWithFrame:CGRectMake(20, 200, 80, 55)];
    [self.view addSubview:placeForPhone];
    placeForPhone.delegate = self;
    placeForPhone.dataSource = self;
    _place = [NSArray arrayWithObjects:@"+86",@"+029",@"+023",nil];
    
}
//手机号地区PickerView代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_place objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _place.count;
}
//案件是否可以按
- (void)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(_phoneNumber.text.length ==11)
    {
        _nextStep.enabled = YES;
    }else{
        _nextStep.enabled = NO;
    }
}
//按按钮跳转到验证码
-(void)click{
    verifyNumber* verifyCon = [[verifyNumber alloc]init];
    [self.navigationController pushViewController:verifyCon animated:YES];
    
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
