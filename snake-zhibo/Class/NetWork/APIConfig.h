//
//  APIConfig.h
//  snake-zhibo
//
//  Created by Snake on 17/7/2.
//  Copyright © 2017年 Snake. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

#define SERVER_HOST @"http://service.ingkee.com"   //信息类服务器地址
//#define SERVER_HOST @"http://116.211.167.106/"   //信息类服务器地址
                           //  /api/live/gettop?uid=133825214&interest=1

#define IMAGE_HOST @"http://img.meelive.cn/"       //图片服务器地址

#define API_HotLive @“api/live/gettop?uid=133825214”              //热门直播

#define API_NearLive @"api/live/near_recommend"      //附近的人   http://service.ingkee.com/api/live/near_recommend?uid=133825214&latitude=40.090562&longitude=116.413353

#define API_Advertise @"advertise/get"                 //广告地址

#define Live_Snake @"rtmp://live.hkstv.hk.lxdns.com:1935/live/snake"  //我的直播地址
@end
