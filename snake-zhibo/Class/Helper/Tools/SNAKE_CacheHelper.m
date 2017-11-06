//
//  SNAKE_CacheHelper.m
//  snake-zhibo
//
//  Created by Snake on 17/7/5.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_CacheHelper.h"

#define advertiseImage @"adImage"

@implementation SNAKE_CacheHelper

+(NSString *)getAdvertise
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:advertiseImage];
}

+(void)setAdvertise:(NSString *)adImage
{
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertiseImage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
