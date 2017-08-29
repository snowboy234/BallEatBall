//
//  TWGameViewController.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/29.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWGameViewController.h"

@interface TWGameViewController ()
@property (nonatomic, strong) UIImageView * dangbanView;
@property (nonatomic, assign) BOOL move;
@end

@implementation TWGameViewController

#define One TWScreenWidth / 12.0

- (void)viewDidLoad {
    [super viewDidLoad];
    _move = YES;
    [self bgImageView];
    [self dangbanImageView];
}

- (void)bgImageView{
    UIImageView * bg = [[UIImageView alloc]initWithFrame:self.view.frame];
    bg.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg];
}

- (void)dangbanImageView{
    CGFloat width = TWScreenWidth + One;
    CGFloat height = width * 16 / 520.0;
    _dangbanView = [[UIImageView alloc]initWithFrame:CGRectMake(0, TWScreenHeight * 0.75, width, height)];
    _dangbanView.image = [UIImage imageNamed:@"dangban"];
    [self.view addSubview:_dangbanView];
    
    // 添加小的版块
    CGFloat smallWidth = 40 * height / 16.0;
    for (NSInteger i = 0; i < 7; i++) {
        UIImageView * small = [[UIImageView alloc]initWithFrame:CGRectMake(i * smallWidth * 2, 0, One, height)];
        small.image = [UIImage imageNamed:@"ban"];
        [_dangbanView addSubview:small];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_move) {
        _dangbanView.tw_x = -One;
        _move = NO;
    } else {
        _dangbanView.tw_x = 0;
        _move = YES;
    }
}

@end
