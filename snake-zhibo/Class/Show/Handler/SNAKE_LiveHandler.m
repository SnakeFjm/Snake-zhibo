//
//  SNAKE_LiveHandler.m
//  snake-zhibo
//
//  Created by Snake on 17/7/2.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_LiveHandler.h"
#import "HttpTool.h"
#import "SNAKE_Live.h"
#import "SNAKE_LocationManager.h"
#import "SNAKE_Advertise.h"

@implementation SNAKE_LiveHandler

+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:@"api/live/gettop?uid" params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue])
        {
            failed(json[@"error_msg"]);
        }
        else
        {
            
           NSArray * lives = [SNAKE_Live mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
           success(lives);   //正确则做数据解析
        }
        
    } failure:^(NSError *error) {
        
        failed(error);
        
    }];
    
}

+(void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    SNAKE_LocationManager * manager = [SNAKE_LocationManager sharedManager];
    
    NSDictionary * params = @{@"uid":@"133825214",
                              @"latitude":manager.lat,
                              @"longitude":manager.lon
                              };
    
    [HttpTool getWithPath:@"api/live/near_recommend?" params:params success:^(id json) {
        
        if ([json[@"dm_error"] integerValue])
        {
            failed(json[@"error_msg"]);
        }
        else
        {
            
            NSArray * lives = [SNAKE_Live mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);   //正确则做数据解析
        }
        
    } failure:^(NSError *error) {
        
        failed(error);
        
    }];
}

+(void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        
        if ([json[@"dm_error"] integerValue])
        {
            failed(json[@"error_msg"]);
        }
        else
        {
            
            SNAKE_Advertise * advertise = [SNAKE_Advertise mj_objectWithKeyValues:json[@"resources"][0]];
            
            success(advertise);   //正确则做数据解析
        }
        
    } failure:^(NSError *error) {
        failed(error);
    }];
}

@end
