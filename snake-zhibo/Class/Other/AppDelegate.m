//
//  AppDelegate.m
//  snake-zhibo
//
//  Created by Snake on 17/6/16.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "AppDelegate.h"
#import "SNAKE_TabBarViewController.h"
#import "SNAKE_LocationManager.h"
#import "SNAKE_AdvertiseView.h"
#import "AppDelegate+SNAKE_UMeung.h"
#import "UMSocial.h"
#import "UMSocialSinaSSOHandler.h"
#import "SNAKE_LoginViewController.h"
#import "SNAKE_UserHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    NSLog(@"%@",identifier);
    NSLog(@"                          hahahahhhhhhhhhhhhhhhh          ");
    */
    [self setupUmeung];  //初始化友盟控件
    
    UIViewController * mainVC ;
    
    if([SNAKE_UserHelper isAutoLogin])
    {
        mainVC = [[SNAKE_TabBarViewController alloc] init];
    }
    else
    {
        mainVC = [[SNAKE_LoginViewController alloc] init];
    }
    
        
    self.window.rootViewController = mainVC ;
    
    [[SNAKE_LocationManager sharedManager] getGps:^(NSString *lat, NSString *lon) {
        
        //NSLog(@"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊");
        NSLog(@"%@%@",lat,lon);
        
    }];
    
    [self.window makeKeyAndVisible];
    
    SNAKE_AdvertiseView * advertise = [SNAKE_AdvertiseView loadAdvertiseView];
    [self.window addSubview:advertise];
    
    return YES;
    
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation          //添加了这个方法才能在分享后从其他应用回到我们的应用来。
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

//这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
- (void)applicationDidBecomeActive:(UIApplication *)application

{
    
    [UMSocialSnsService  applicationDidBecomeActive];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}





- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
