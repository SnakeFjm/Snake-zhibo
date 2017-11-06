//
//  SNAKE_MainTopView.m
//  snake-zhibo
//
//  Created by Snake on 17/7/2.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_MainTopView.h"

@interface SNAKE_MainTopView()

@property (nonatomic,strong) UIView * lineView;

@property (nonatomic,strong) NSMutableArray * buttons;

@end

@implementation SNAKE_MainTopView

-(NSMutableArray *)buttons
{
    if(!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat binW = self.width / titles.count;
        CGFloat binH = self.height;
        
        for (NSInteger i = 0; i<titles.count; i++)
        {
            UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [self.buttons addObject:titleBtn];
            
            NSString * vcName = titles[i];
            
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
             titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            
            titleBtn.tag = i;
            
            titleBtn.frame = CGRectMake(i * binW, 0, binW, binH);
            
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleBtn];
            
            
            if(i == 1)
            {
                CGFloat h = 2;
                CGFloat y = 40;
                
                [titleBtn.titleLabel sizeToFit];
                
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView.height = h;
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}


-(void)scrolling:(NSInteger)tag           //mainnvc 滚动时调用
{
    UIButton * button = self.buttons[tag];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = button.centerX;
    }];
}

-(void)titleClick:(UIButton *)button    //点击事件
{
    self.block(button.tag);
    
    [self scrolling:button.tag];
    /*
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = button.centerX;
    }];
    */
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
