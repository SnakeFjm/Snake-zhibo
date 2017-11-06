//
//  SNAKE_TabBar.m
//  snake-zhibo
//
//  Created by Snake on 17/6/17.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_TabBar.h"

@interface SNAKE_TabBar ()

@property (nonatomic,strong) UIImageView * tabbgView;

@property (nonatomic,strong) NSArray * datalist;

@property (nonatomic,strong) UIButton * lastItem;

@property (nonatomic,strong) UIButton * cameraButton;

@end

@implementation SNAKE_TabBar

-(UIButton *)cameraButton
{
    if(!_cameraButton)
    {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraButton sizeToFit];
        _cameraButton.tag = SNAKE_ItemTypeLaunch;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _cameraButton;
}

-(NSArray *)datalist
{
    if(!_datalist)
    {
        _datalist = @[@"tab_live",@"tab_me"];
    }
    return _datalist;
}

-(UIImageView *)tabbgView
{
    if(!_tabbgView)
    {
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    
    return _tabbgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        [self addSubview:self.tabbgView];   //装载背景
        
        for (NSInteger i = 0 ; i < self.datalist.count; i++)
        {
            
            UIButton* item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            item.adjustsImageWhenHighlighted = NO ;  //不让图片在高亮下改变
            
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = SNAKE_ItemTypeZhibo + i ;
            
            if(i == 0)
            {
                item.selected = YES ;
                self.lastItem = item ;
            }
            
            [self addSubview:item];
            
        }
        
        [self addSubview:self.cameraButton];  //添加直播按钮
        
    }
    return self;
}

-(void)layoutSubviews    //调整子视图
{
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds ;
    
    CGFloat width = self.bounds.size.width / self.datalist.count ;  //每个button的宽度
    
    for (NSInteger i = 0; i < [self subviews].count; i++)
    {
        UIView * btn = [self subviews][i];
        
        if([btn isKindOfClass:[UIButton class]])  //判断是否为button
        {
            btn.frame = CGRectMake((btn.tag - SNAKE_ItemTypeZhibo) * width ,0, width, self.frame.size.height);  //x坐标用btn的target值确定第几个btn
        }
    }
    
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size.width / 2,self.bounds.size.height - 40) ;
    
}

-(void)clickItem:(UIButton *)button      //点击button调用协议
{
    if([self.delegate respondsToSelector:@selector(tabbar:clickButton:)])  //判断是否能相应该协议方法
    {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    
    if(self.block)
    {
        self.block(self,button.tag);
    }
    
    if(button.tag == SNAKE_ItemTypeLaunch)
    {
        return;
    }
    
    self.lastItem.selected = NO ;
    button.selected = YES ;
    self.lastItem = button ;
    
    [UIView animateWithDuration:0.2 animations:^{
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);  //扩大1.2倍
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            button.transform =CGAffineTransformIdentity;   //恢复原始状态
        }];
    }];
}

@end
