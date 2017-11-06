//
//  SNAKE_MeinfoView.m
//  snake-zhibo
//
//  Created by Snake on 17/7/7.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_MeinfoView.h"

@implementation SNAKE_MeinfoView

+(instancetype)loadInfoView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SNAKE_MeinfoView" owner:self options:nil] lastObject];
}

@end
