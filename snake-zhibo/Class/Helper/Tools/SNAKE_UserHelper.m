//
//  SNAKE_UserHelper.m
//  snake-zhibo
//
//  Created by Snake on 17/7/7.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_UserHelper.h"

@implementation SNAKE_UserHelper

+(instancetype)sharedUser
{
    static SNAKE_UserHelper * _user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _user = [[SNAKE_UserHelper alloc] init];
        
    });
    return _user;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
       _nickName = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
       _iconUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconUrl"];
    
    }
    return self;
}

+(BOOL)isAutoLogin
{
    if([SNAKE_UserHelper sharedUser].nickName.length == 0)
    {
        return NO;
    }
    return YES;
}

+(void)saveUser
{
    SNAKE_UserHelper * user = [SNAKE_UserHelper sharedUser];
    if(user.nickName.length != 0)
    {
        [[NSUserDefaults standardUserDefaults] setObject:user.nickName forKey:@"nickName"];
        [[NSUserDefaults standardUserDefaults] setObject:user.iconUrl forKey:@"icoUrl"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

@end
