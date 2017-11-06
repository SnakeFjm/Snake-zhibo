//
//  SNAKE_MainTopView.h
//  snake-zhibo
//
//  Created by Snake on 17/7/2.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface SNAKE_MainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property (nonatomic,copy) MainTopBlock block;

-(void)scrolling:(NSInteger)tag;

@end
