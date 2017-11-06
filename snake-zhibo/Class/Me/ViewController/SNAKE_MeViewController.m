//
//  SNAKE_MeViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/7/7.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_MeViewController.h"
#import "SNAKE_MeinfoView.h"
#import "SNAKE_Setting.h"

@interface SNAKE_MeViewController ()

@property (nonatomic, strong) NSMutableArray * datalist;

@property (nonatomic, strong) SNAKE_MeinfoView * infoView;

@end

@implementation SNAKE_MeViewController

- (NSMutableArray *)dataList {
    
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


-(SNAKE_MeinfoView *)infoView
{
    if (!_infoView)
    {
        _infoView = [SNAKE_MeinfoView loadInfoView];

    }
    
    return _infoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableHeaderView = self.infoView;
    self.tableView.tableHeaderView.height = SCREEN_HEIGHT * 0.4;
    
    self.tableView.rowHeight = 50;
    self.tableView.sectionFooterHeight = 20;
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.tabBarController.tabBar.bounds.size.height + 20, 0);
    
    self.tableView.tableFooterView = [[UIView alloc] init];  //TableView不显示没内容的Cell
    
    // self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    
   // self.tableView.frame=CGRectMake (0,0,SCREEN_WIDTH,200);
   // self.tabBarController.tabBar.autoresizesSubviews = NO;
    
    [self loadData];
    
}

-(void)loadData
{
    SNAKE_Setting * set1 = [[SNAKE_Setting alloc] init];
    set1.title = @"贡献榜";
    set1.subTitle = @"";
    set1.vcName = @"SNAKE_GongViewController";
    
    SNAKE_Setting * set2 = [[SNAKE_Setting alloc] init];
    set2.title = @"收益";
    set2.subTitle = @"我点知";
    set2.vcName = @"SNAKE_ShouViewController";
    
    SNAKE_Setting * set3 = [[SNAKE_Setting alloc] init];
    set3.title = @"账户";
    set3.subTitle = @"满钻石";
    set3.vcName = @"SNAKE_ZhangViewController";
    
    SNAKE_Setting * set4 = [[SNAKE_Setting alloc] init];
    set4.title = @"等级";
    set4.subTitle = @"满级";
    set4.vcName = @"SNAKE_DengViewController";
    
    SNAKE_Setting * set5 = [[SNAKE_Setting alloc] init];
    set5.title = @"实名认证";
    set5.subTitle = @"";
    set5.vcName = @"";
    
    SNAKE_Setting * set6 = [[SNAKE_Setting alloc] init];
    set6.title = @"设置";
    set6.subTitle = @"";
    set6.vcName = @"SNAKE_SettingViewController";
    
    NSArray * arr1 = @[set1,set2,set3];
    NSArray * arr2 = @[set4,set5];
    NSArray * arr3 = @[set6];

    self.datalist = [@[arr1,arr2,arr3] mutableCopy];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //NSLog(@"%lu",(unsigned long)self.datalist.count);
    return self.datalist.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * arr = self.datalist[section];
    
    //NSLog(@"%lu",(unsigned long)arr.count);
   // NSLog(@"ddsafsadjflkajslfjalsdkjfa;jf;akljf;aklj;l");
    return arr.count;
   
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    SNAKE_Setting * set = self.datalist[indexPath.section][indexPath.row];
    
    cell.textLabel.text = set.title;
    
    cell.detailTextLabel.text = set.subTitle;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
/*
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return self.infoView;
    }
    return nil;
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    /*
    if(section == 0)
    {
        return SCREEN_HEIGHT * 0.5;
    }
     */
    return 5;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
