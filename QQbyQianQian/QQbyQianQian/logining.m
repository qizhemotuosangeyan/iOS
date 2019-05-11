//
//  logining.m
//  QQbyQianQian
//
//  Created by 千千 on 2019/5/4.
//  Copyright © 2019 千千. All rights reserved.
//

#import "logining.h"
#import "ViewController.h"
#import "addFriendViewController.h"
@interface logining ()
@end

@implementation logining

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //tabBarView视图创建
    
    UITabBarController* tabBar = [[UITabBarController alloc]init];
    NSMutableArray * tabBarArray = [[NSMutableArray alloc]init];
    UIViewController*con1 = [[UIViewController alloc]init];
    UIViewController * con2 = [[UIViewController alloc]init];
    UIViewController*con3 = [[UIViewController alloc]init];
    con1.tabBarItem.image = [UIImage imageNamed:@"news.png"];
    con2.tabBarItem.image = [UIImage imageNamed:@"contact.png"];
    con3.tabBarItem.image = [UIImage imageNamed:@"recent.png"];
    con1.tabBarItem.selectedImage = [UIImage imageNamed:@"news.png"];
    con2.tabBarItem.selectedImage = [UIImage imageNamed:@"contact.png"];
    con3.tabBarItem.selectedImage = [UIImage imageNamed:@"recent.png"];
    [tabBarArray addObject:con1];
    [tabBarArray addObject:con2];
    [tabBarArray addObject:con3];
//    tabBar.tabBar.barTintColor = [UIColor whiteColor];
    con1.view.backgroundColor = [UIColor whiteColor];
    con2.view.backgroundColor = [UIColor whiteColor];
    con3.view.backgroundColor = [UIColor whiteColor];
    tabBar.viewControllers = tabBarArray;
    tabBar.tabBarItem.image = [UIImage imageNamed:@"contact.png"];
    [self presentViewController:tabBar animated:YES completion:nil];
 
    
    
    //消息栏con1
        UIImageView * topColor = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 500, 100)];
        topColor.image = [UIImage imageNamed:@"blueColor.png"];
        [con1.view addSubview:topColor];
        UILabel * topText = [[UILabel alloc]initWithFrame:CGRectMake(184, 45, 60, 40)];
        topText.textColor = [UIColor whiteColor];
        topText.text = [NSString stringWithFormat:@"消息"];
        [con1.view addSubview:topText];

        //好友列表
        UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];//Plain简朴的
        [con1.view addSubview:tableView];
        tableView.editing = NO;//允许表格的增删
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.frame = CGRectMake(0, 104,415, 10000);
        //搜索栏
        UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 415, 40)];
        [con1.view addSubview:searchBar];
        searchBar.placeholder = [NSString stringWithFormat:@"搜索"];

    // 联系人栏con2
    UIImageView * topColor2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 500, 100)];
    topColor2.image = [UIImage imageNamed:@"blueColor.png"];
    [con2.view addSubview:topColor2];
    UILabel * topText2 = [[UILabel alloc]initWithFrame:CGRectMake(184, 45, 60, 40)];
    topText2.textColor = [UIColor whiteColor];
    topText2.text = [NSString stringWithFormat:@"联系人"];
    [con2.view addSubview:topText2];
    // 搜索栏
    UISearchBar * searchBar2 = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 415, 40)];
    [con2.view addSubview:searchBar2];
    searchBar2.placeholder = [NSString stringWithFormat:@"搜索"];
    //seg栏
    UISegmentedControl * seg = [[UISegmentedControl alloc]initWithFrame:CGRectMake(70, 140, 615, 40)];
    [seg initWithItems:@[@"好友",@"群聊",@"设备",@"通讯录",@"公众号"]];
    [con2.view addSubview:seg];
    seg.selectedSegmentIndex = 1;
    [seg addTarget:self action:@selector(chooseSeg:) forControlEvents:UIControlEventValueChanged];
    //添加好友按钮
    UIButton * addFriend = [[UIButton alloc]initWithFrame:CGRectMake(360, 60, 30, 30)];
    [addFriend setImage:[UIImage imageNamed:@"addFriendImage"] forState:normal];
    addFriend.backgroundColor = [UIColor blackColor];
    [addFriend setBackgroundImage:[UIImage imageNamed:@"blueColor.png"] forState:normal];
    [con2.view addSubview:addFriend];
    [addFriend addTarget:self action:@selector(addFriendClick) forControlEvents:UIControlEventTouchDown];
//动态con3
    //蓝色顶栏
    UIImageView * topColor3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 500, 100)];
    topColor3.image = [UIImage imageNamed:@"blueColor.png"];
    [con3.view addSubview:topColor3];
    UILabel * topText3 = [[UILabel alloc]initWithFrame:CGRectMake(184, 45, 60, 40)];
    topText3.textColor = [UIColor whiteColor];
    topText3.text = [NSString stringWithFormat:@"动态"];
    [con3.view addSubview:topText3];
    // 搜索栏
    UISearchBar * searchBar3 = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 415, 40)];
    [con3.view addSubview:searchBar3];
    searchBar3.placeholder = [NSString stringWithFormat:@"搜索"];
    [con3.view addSubview:searchBar3];
    //好友动态
    UIButton * friendsNews = [[UIButton alloc]initWithFrame:CGRectMake(0, 140, 415, 55)];
//    friendsNews.backgroundColor = [UIColor blackColor];
    [con3.view addSubview:friendsNews];
    [friendsNews setTitle:[NSString stringWithFormat:@"好友动态"] forState:normal];
    [friendsNews setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [friendsNews setTitleColor:[UIColor blackColor] forState:normal];
    [friendsNews setImage:[UIImage imageNamed:@"friendNews"] forState:normal];
    friendsNews.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [friendsNews addTarget:con3 action:@selector(friendNewsClick) forControlEvents:normal];
    // >
    UIImageView * Item1 = [[UIImageView alloc]initWithFrame:CGRectMake(390, 160, 10, 10)];
    [Item1 setImage:[UIImage imageNamed:@">.png"]];
    [con3.view addSubview:Item1];
    
    
}
//con1表格代理
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
    }
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 7;
    }
    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 分区第%ld行,昵称",indexPath.section,indexPath.row];
        cell.detailTextLabel.text = @"个性签名";
        cell.imageView.image = [UIImage imageNamed:@"logo.png"];
        cell.accessoryType = UITableViewCellAccessoryNone;

        return cell;
    }
    //每格高度
    -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 80;
    }
    -(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
        return UITableViewCellEditingStyleNone;
    }
    //移动
    -(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
        return NO;
    }
    -(BOOL)tableView:(UITableView *)tableView moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath{
        return NO;
    }
//con2响应
-(void)chooseSeg:(UISegmentedControl *)seg{
    if(seg.selectedSegmentIndex == 0)//点击了好友
    {
        //生成分组
        
    }
    else if (seg.selectedSegmentIndex == 1)//点击了群聊
    {
        
    }else if (seg.selectedSegmentIndex == 2)//点击了设备
    {
        
    }else if (seg.selectedSegmentIndex == 3)//点击了通讯录
    {
        
    }else if(seg.selectedSegmentIndex == 4)//点击了公众号
    {
        
    }

}
-(void)addFriendClick{
    addFriendViewController * con = [[addFriendViewController alloc]init];
    [self.navigationController pushViewController:con animated:YES];
//    [_con2.navigationController pushViewController:con animated:YES];
}
-(void)friendNewsClick{
    StayTunedViewController* con0 = [[StayTunedViewController alloc]init];
    [self.navigationController pushViewController:con0 animated:YES];
}

@end

//以下代码来自FYH
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = NO;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
