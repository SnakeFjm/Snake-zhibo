//
//  SNAKE_Near_ViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/6/18.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_Near_ViewController.h"
#import "SNAKE_LiveHandler.h"
#import "SNAKE_NearLiveCell.h"
#import "SNAKE_PlayerViewController.h"

static NSString * identifier = @"SNAKE_NearLiveCell";

#define kMargin 5
#define KItemWidth 100

@interface SNAKE_Near_ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSArray * datalist;

@end

@implementation SNAKE_Near_ViewController

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath   //将要显示调用
{
    
    SNAKE_NearLiveCell * c = (SNAKE_NearLiveCell *)cell;
    
    [c showAnimation];
        
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = self.collectionView.width / KItemWidth;
    
    CGFloat etraWidth = (self.collectionView.width - kMargin * (count + 1)) / count;
    
    return CGSizeMake(etraWidth, etraWidth + 20);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datalist.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SNAKE_NearLiveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.live = self.datalist[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    SNAKE_Live * live = self.datalist[indexPath.row];
    
    SNAKE_PlayerViewController * playerVC = [[SNAKE_PlayerViewController alloc] init];
    playerVC.live = live;
    //playerVC.hidesBottomBarWhenPushed = YES;  //隐藏bar
    [self.navigationController pushViewController:playerVC animated:YES];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
    
    [self loadData];
    
}

-(void)initUI
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"SNAKE_NearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
}


-(void)loadData
{
    [SNAKE_LiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
        
        NSLog(@"%@",obj);
       // [self.datalist arrayByAddingObjectsFromArray:obj];
        
        self.datalist = obj;
        [self.collectionView reloadData];
        
    } failed:^(id obj) {
        
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
