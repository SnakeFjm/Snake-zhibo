//
//  AppDelegate+SNAKE_UMeung.m
//  snake-zhibo
//
//  Created by Snake on 17/7/6.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "AppDelegate+SNAKE_UMeung.h"
#import "UMSocial.h"
#import "UMSocialSinaSSOHandler.h"

@implementation AppDelegate (SNAKE_UMeung)

-(void)setupUmeung
{
    
     /*
    //设置umengkey
    [UMSocialData setAppKey:@"595eeb6404e2054c800016c8"];
    //RedirectURL 授权回调页
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"806501790"
                                              secret:@"720c7060d9890b1fcdf66dadd47b0c44"
                                         RedirectURL:@"https://api.weibo.com/oauth2/default.html"];
    */
    
    
    //设置umengkey
    [UMSocialData setAppKey:@"595eeb6404e2054c800016c8"];
     
    //RedirectURL 授权回调页
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2426655723"
                                              secret:@"9786d611c013f1605e021744db910297"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
     
     
    
    /*
     //设置umengkey
     [UMSocialData setAppKey:@"57a5581267e58e2557001639"];
    
     //RedirectURL 授权回调页
     [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2892166685"
                                                secret:@"7849eb7a9922c4318b1a0cff9a215ff3"
                                            RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
     */
     
}

@end
