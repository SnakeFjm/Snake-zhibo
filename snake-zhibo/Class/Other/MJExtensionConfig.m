//
//  MJExtensionConfig.m
//  snake-zhibo
//
//  Created by Snake on 17/7/3.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "SNAKE_Creator.h"
#import "SNAKE_Live.h"

@implementation MJExtensionConfig

+(void)load
{
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID":@"id"
                 };
    }];
    
    [SNAKE_Creator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc":@"description"
                 };
    }];
    
    [SNAKE_Creator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {         //驼峰转下划线
        return [propertyName mj_underlineFromCamel];
    }];
    
    [SNAKE_Live mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {         //驼峰转下划线
        return [propertyName mj_underlineFromCamel];
    }];}

@end
