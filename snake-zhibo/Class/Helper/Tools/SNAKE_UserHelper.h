//
//  SNAKE_UserHelper.h
//  snake-zhibo
//
//  Created by Snake on 17/7/7.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNAKE_UserHelper : NSObject

@property (nonatomic,copy) NSString * iconUrl;

@property (nonatomic,copy) NSString * nickName;

+(instancetype)sharedUser;

+(BOOL)isAutoLogin;

+(void)saveUser;

@end
