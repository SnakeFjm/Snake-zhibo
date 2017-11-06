//
//  SNAKE_LiveChatViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/7/4.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_LiveChatViewController.h"

@interface SNAKE_LiveChatViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *peopleCountLB;

@end

@implementation SNAKE_LiveChatViewController

-(void)setLive:(SNAKE_Live *)live
{
    _live = live;
    
   // [self.iconView downloadImage:[NSString stringWithFormat:@"%@%@",@"http://img.meelive.cn/",live.creator.portrait] placeholder:@"2"];
    
    [self.iconView downloadImage:[NSString stringWithFormat:@"%@",live.creator.portrait] placeholder:@"2"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.iconView.layer.cornerRadius = 15;
    self.iconView.layer.masksToBounds = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        self.peopleCountLB.text = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    } repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
