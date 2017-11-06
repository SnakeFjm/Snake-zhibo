//
//  SNAKE_Hot_ViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/6/18.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_Hot_ViewController.h"
#import "SNAKE_LiveHandler.h"
#import "SNAKE_LiveCell.h"
#import "SNAKE_PlayerViewController.h"

static NSString * indentifier = @"SNAKE_LiveCell";

@interface SNAKE_Hot_ViewController ()

@property (nonatomic,strong) NSMutableArray * datalist;

@end

@implementation SNAKE_Hot_ViewController

-(NSMutableArray *)datalist
{
    if (!_datalist) {
        _datalist = [[NSMutableArray alloc] init];
    }
    return _datalist;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datalist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SNAKE_LiveCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier ];
    
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
    [self.tableView registerNib:[UINib nibWithNibName:@"SNAKE_LiveCell" bundle:nil] forCellReuseIdentifier:indentifier];  //注册自定义的cell
    
    //self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.tabBarController.tabBar.bounds.size.height, 0);
}

-(void)loadData
{
    [SNAKE_LiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        //NSLog(@"成功恍恍惚惚红红火火");
        //NSLog(@"%@",obj);
        
        [self.datalist addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(id obj) {
        NSLog(@"失败恍恍惚惚红红火火");
        NSLog(@"%@",obj);
    }];
    
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
