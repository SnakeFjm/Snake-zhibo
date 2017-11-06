//
//  SNAKE_NearLiveCell.m
//  snake-zhibo
//
//  Created by Snake on 17/7/5.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_NearLiveCell.h"

@interface SNAKE_NearLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;


@end

@implementation SNAKE_NearLiveCell

-(void)showAnimation
{
    if(self.live.isShow)
    {
        return;
    }
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        self.live.show = YES;
    }];
    
}

-(void)setLive:(SNAKE_Live *)live
{
    _live = live;
    
    [self.headView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"2"];
    
    self.distanceLabel.text = live.distance;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
