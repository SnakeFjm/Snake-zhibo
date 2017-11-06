//
//  SNAKE_BaseHandler.h
//  snake-zhibo
//
//  Created by Snake on 17/7/2.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompleteBlock)();   //处理完成事件

typedef void(^SuccessBlock)(id obj);   //处理事件成功，返回数据

typedef void(^FailedBlock)(id obj);     //处理事件失败，错误信息

@interface SNAKE_BaseHandler : NSObject

@end
