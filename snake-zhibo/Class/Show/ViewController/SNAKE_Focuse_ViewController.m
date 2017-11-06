//
//  SNAKE_Focuse_ViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/6/18.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_Focuse_ViewController.h"
#import "SNAKE_LiveCell.h"
#import "SNAKE_PlayerViewController.h"

static NSString * identifier = @"focuse";

@interface SNAKE_Focuse_ViewController ()

@property (nonatomic,strong) NSArray * datalist;

@end

@implementation SNAKE_Focuse_ViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SNAKE_LiveCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    
    cell.live = self.datalist[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70 + SCREEN_WIDTH;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SNAKE_Live * live = self.datalist[indexPath.row];
    
    SNAKE_PlayerViewController * playerVC = [[SNAKE_PlayerViewController alloc] init];
    playerVC.live = live;
    //playerVC.hidesBottomBarWhenPushed = YES;  //隐藏bar
    [self.navigationController pushViewController:playerVC animated:YES];
    
    /*
     MPMoviePlayerViewController * movieVC = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:live.streamAddr]];
     
     [self presentViewController:movieVC animated:YES completion:nil];
     */
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self UI];
    
    [self loadData];
    
}

-(void)UI
{
    [self.tableView registerNib:[UINib nibWithNibName:@"SNAKE_LiveCell" bundle:nil] forCellReuseIdentifier:identifier];  //注册自定义的cell
}

-(void)loadData
{
    SNAKE_Live * live = [[SNAKE_Live alloc] init];
    live.city = @"广州";
    live.onlineUsers = 100;
    live.streamAddr = Live_Snake;
    
    
    SNAKE_Creator * creat = [[SNAKE_Creator alloc] init];
    live.creator = creat;
    
    creat.nick = @"蛇仔";
    creat.portrait = @"snake";
    
    self.datalist = @[live];
    [self.tableView reloadData];
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
