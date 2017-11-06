//
//  SNAKE_LocationManager.h
//  snake-zhibo
//
//  Created by Snake on 17/7/4.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString * lat,NSString * lon);   //block回传

@interface SNAKE_LocationManager : NSObject

+ (instancetype)sharedManager;

-(void)getGps:(LocationBlock)block;

@property (nonatomic,copy) NSString * lat;
@property (nonatomic,copy) NSString * lon;

@end
