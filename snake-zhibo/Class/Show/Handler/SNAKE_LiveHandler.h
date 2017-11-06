//
//  SNAKE_LiveHandler.h
//  snake-zhibo
//
//  Created by Snake on 17/7/2.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_BaseHandler.h"

@interface SNAKE_LiveHandler : SNAKE_BaseHandler

+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;  //获取热门直播信息

+(void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;  //获取附近的直播信息

+(void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed; //获取广告页

@end
