//
//  SNAKE_Main_ViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/6/18.
//  Copyright © 2017年 Snake. All rights reserved.
//


#import "SNAKE_Main_ViewController.h"
#import "SNAKE_MainTopView.h"

@interface SNAKE_Main_ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic,strong) NSArray * datalist;

@property (nonatomic,strong) SNAKE_MainTopView * topView;

@end

@implementation SNAKE_Main_ViewController

-(SNAKE_MainTopView *)topView
{
    if(!_topView)
    {
        _topView = [[SNAKE_MainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.datalist];
        
        @weakify(self);
        _topView.block = ^(NSInteger tag){
            @strongify(self);
            
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, self.contentScrollView.contentOffset.y);
        
            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _topView;
}

-(NSArray *)datalist
{
    if(!_datalist)
    {
        _datalist = @[@"关注",@"热门",@"附近"];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
}

-(void)initUI
{
    
    [self setupNav];  //添加左右按钮
    
    [self setupChildViewControllers];
    
}

-(void)setupChildViewControllers
{
    NSArray * vcNames = @[@"SNAKE_Focuse_ViewController",@"SNAKE_Hot_ViewController",@"SNAKE_Near_ViewController"];
    
    for (NSInteger i = 0; i < vcNames.count; i++)
    {
        NSString * vcName = vcNames[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        
        vc.title = self.datalist[i];
        [self addChildViewController:vc];
        
    }
    
    //将子控制器的view，加到MainVC的scrollview上
    //设置scrollview的contentsize
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.datalist.count, 0);
    
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);  //默认展示第二个页面
    
     [self scrollViewDidEndScrollingAnimation:self.contentScrollView];  //进入主控制器加载第一个画面
}

-(void)setupNav
{
    self.navigationItem.titleView = self.topView ;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView  //动画结束时调用代理
{
    
    
    CGFloat width = SCREEN_WIDTH;      //scrollView.frame.size.width ;
    CGFloat height = SCREEN_HEIGHT ;
    
    CGFloat offset = scrollView.contentOffset.x;
    
    NSInteger idx = offset / width;  //获取索引值
    
    [self.topView scrolling:idx];   //索引值联动topView
    
    UIViewController * vc = self.childViewControllers[idx];  //根据索引值返回vc的引用
    
    if([vc isViewLoaded])  //是否加载过
    {
        return;
    }
    
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);  //设置子控制器view的大小
    
    [scrollView addSubview:vc.view];   //将子控制器的view加入scrollview
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  //减速结束时调用加载子控制器view的方法
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
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
