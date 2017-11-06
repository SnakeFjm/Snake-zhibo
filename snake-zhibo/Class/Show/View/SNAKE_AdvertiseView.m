//
//  SNAKE_AdvertiseView.m
//  snake-zhibo
//
//  Created by Snake on 17/7/5.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_AdvertiseView.h"
#import "SNAKE_LiveHandler.h"
#import "SNAKE_Advertise.h"
#import "SNAKE_CacheHelper.h"

static NSUInteger showTime = 3;

@interface SNAKE_AdvertiseView ()

@property (weak, nonatomic) IBOutlet UIImageView *backView;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation SNAKE_AdvertiseView

+(instancetype)loadAdvertiseView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SNAKE_AdvertiseView" owner:self options:nil] lastObject];
    
}

-(void)awakeFromNib  //初始化广告业
{
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;
    
    [self showAd];    //显示广告
    
    [self downAd];      //下载广告
    
    [self startTimer];  //倒计时
}

-(void)showAd
{
    NSString * filename = [SNAKE_CacheHelper getAdvertise];
    NSString * filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,filename];
    UIImage* lastCacheImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    if (lastCacheImage)
    {
        self.backView.image = lastCacheImage;
    }
    else
    {
        //self.hidden = YES;
        self.backView.image = [UIImage imageNamed:@"3"];
    }
}

-(void)downAd
{
    [SNAKE_LiveHandler executeGetAdvertiseTaskWithSuccess:^(id obj) {    //获取最新广告数据
        
        SNAKE_Advertise * ad = obj;
        NSURL * imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,ad.image]];
        
        //SDWebImageAvoidAutoSetImage 下载完不给imageview赋值
        [[SDWebImageManager sharedManager] downloadImageWithURL:imageUrl options:SDWebImageAvoidAutoSetImage progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
            [SNAKE_CacheHelper setAdvertise:ad.image];
            
            NSLog(@"图片下载成功");
        }];
        
        
    } failed:^(id obj) {
        
    }];
}

-(void)startTimer
{
    __block NSUInteger timeout = showTime + 1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    self.timer = timer;
    
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (timeout <= 0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{        //跳回主线程
                
                [self dissmiss];
                
            })
            ;
        }
        else
        {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                  self.timeLabel.text = [NSString stringWithFormat:@"跳过 %zd",timeout];

            });
            
            timeout--;

        }
        
    });
    dispatch_resume(timer);
}

-(void)dissmiss
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.f;
    }completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

@end
