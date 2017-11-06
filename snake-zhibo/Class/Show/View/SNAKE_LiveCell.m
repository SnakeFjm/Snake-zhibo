//
//  SNAKE_LiveCell.m
//  snake-zhibo
//
//  Created by Snake on 17/7/3.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_LiveCell.h"

@interface SNAKE_LiveCell()

@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;


@end

@implementation SNAKE_LiveCell

-(void)setLive:(SNAKE_Live *)live
{
    _live = live;
    
   /* [self.headView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    */
    
   // [self.headView setImage:[UIImage imageNamed:@"1"]];
    
    
   
    
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onlineLabel.text =[@(live.onlineUsers) stringValue];
    
    if ([live.creator.portrait isEqualToString:@"snake"]) {
        self.headView.image = [UIImage imageNamed:@"2"];
        self.bigImageView.image = [UIImage imageNamed:@"2"];
    }
    else
    {
        
       [self.headView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"2"];
    
       [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"2"];
    }
    
    
    
   // [self.bigImageView setImage:[UIImage imageNamed:@"2"]];
    
    /*
    [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    */
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //self.headView.layer.cornerRadius = 25;
    //self.headView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
