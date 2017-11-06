//
//  SNAKE_TabBar.h
//  snake-zhibo
//
//  Created by Snake on 17/6/17.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SNAKE_ItemType)
{
    SNAKE_ItemTypeLaunch = 10,    //启动直播
    SNAKE_ItemTypeZhibo = 100,   //展示直播
    SNAKE_ItemTypeMe,      //我的
};

@class SNAKE_TabBar;

typedef void(^TabBlock)(SNAKE_TabBar * tabbar, SNAKE_ItemType idx);

@protocol SNAKE_TabBarDelegate <NSObject>  //协议

-(void)tabbar:(SNAKE_TabBar *)tabbar clickButton:(SNAKE_ItemType) idx;

@end



@interface SNAKE_TabBar : UIView

@property (nonatomic,weak) id<SNAKE_TabBarDelegate> delegate;

@property (nonatomic,copy) TabBlock block;

@end
