//
//  SNAKE_Launch_ViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/6/18.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_Launch_ViewController.h"
#import "LFLivePreview.h"

@interface SNAKE_Launch_ViewController ()

@end

@implementation SNAKE_Launch_ViewController

- (IBAction)closeLaunch:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startLive:(id)sender
{
    UIView * backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    LFLivePreview * preView = [[LFLivePreview alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:preView];
    
    [preView startLive];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
