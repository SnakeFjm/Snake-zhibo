//
//  SNAKE_NearLiveCell.h
//  snake-zhibo
//
//  Created by Snake on 17/7/5.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNAKE_Live.h"

@interface SNAKE_NearLiveCell : UICollectionViewCell

@property (nonatomic,strong) SNAKE_Live * live;

- (void)showAnimation;
@end
