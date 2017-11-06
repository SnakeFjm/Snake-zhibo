//
//  SNAKE_TabBarViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/6/17.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_TabBarViewController.h"
#import "SNAKE_TabBar.h"
#import "SNAKE_BaseNav_ViewController.h"
#import "SNAKE_Launch_ViewController.h"


@interface SNAKE_TabBarViewController ()<SNAKE_TabBarDelegate>  //协议

@property (nonatomic,strong) SNAKE_TabBar * snake_Tabbar;

@end

@implementation SNAKE_TabBarViewController

-(SNAKE_TabBar *)snake_Tabbar
{
    if(!_snake_Tabbar)
    {
        _snake_Tabbar = [[SNAKE_TabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        
        _snake_Tabbar.delegate = self ;
    }
    return _snake_Tabbar;
}

-(void)tabbar:(SNAKE_TabBar *)tabbar clickButton:(SNAKE_ItemType)idx    //代理回调
{
    
    if(idx != SNAKE_ItemTypeLaunch)
    {
        self.selectedIndex = idx - SNAKE_ItemTypeZhibo ;
        return;
    }
    
    SNAKE_Launch_ViewController * launchVC = [[SNAKE_Launch_ViewController alloc] init];
    
    [self presentViewController:launchVC animated:YES completion:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configViewControllers];  //加载控制器 调用方法
    
    [self.tabBar addSubview:self.snake_Tabbar];  //加载tabbaar
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];        //tabbar阴影线删除
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

-(void)configViewControllers
{
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"SNAKE_Main_ViewController",@"SNAKE_MeViewController"]];  //把要加载的viewcontroller名字写进来
    
    for (NSInteger i = 0; i < array.count; i++)
    {
        NSString * vcName = array[i];  //取出字符串
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];    //将名字反射到UIViewcontroller
        
        SNAKE_BaseNav_ViewController * nav = [[SNAKE_BaseNav_ViewController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];  //将array数组存储到东西为nav
        
    }
    
    self.viewControllers = array ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
