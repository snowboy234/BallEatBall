//
//  TWHomeViewController.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWHomeViewController.h"
#import "TWBall.h"
#import "TWMimi.h"

@interface TWHomeViewController ()<TWBallDelegate, TWMimiDelegate>
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL paused;
@property (nonatomic, strong) TWMimi * mimi;
@end

@implementation TWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 30;
    _paused = NO;
    self.view.backgroundColor = TWRandomColor;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(createBalls) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:60 repeats:YES block:^(NSTimer * _Nonnull timer) {
        _count += 5;
    }];
    
    [self createMimiBall];
}

- (void)createMimiBall{
    _mimi = [[TWMimi alloc]initWithFrame:CGRectMake((TWScreenWidth - 20) * 0.5, (TWScreenHeight - 20) * 0.5, 20, 20)];
    _mimi.delegate = self;
    [self.view addSubview:_mimi];
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(movemimi:)];
    [_mimi addGestureRecognizer:pan];
}

- (void)movemimi:(UIPanGestureRecognizer *)pan{
    if (!self.paused) {

    }
}

- (void)createBalls{
    if (!self.paused) {
        if (self.view.subviews.count <= _count) {
            for (NSInteger i = 0; i < 10; i++) {
                CGFloat wh = [self getRandomNumber:0 to:TWScreenWidth / 3];
                CGFloat x = [self getRandomNumberFromSection1:TWBallMinWidth to1:TWScreenWidth * 0.25 from2:TWScreenWidth * 0.75 to2:TWBallMaxWidth];
                CGFloat y = [self getRandomNumberFromSection1:TWBallMinHeight to1:TWScreenHeight * 0.25 from2:TWScreenHeight * 0.75 to2:TWBallMaxHeight];
                TWBall * ball = [[TWBall alloc]initWithFrame:CGRectMake(x, y, wh, wh)];
                ball.delegate = self;
                [ball startMoveing];
                [self.view addSubview:ball];
            }
        }
    }
}

- (void)gameoverNoti{
    TWLog(@"gameover");
    self.paused = YES;
}

- (void)checkPosition:(TWBall *)ball{
    if ([_mimi checkIfCaught:ball.frame]) {
        ball.caught = YES;
        // 计算得分
    } else {
        // 没抓到
    }
    // 显示分数
}

- (void)removeMe:(TWBall *)ball{
    [ball removeFromSuperview];
}

- (BOOL)checkGameStatus{
    return self.paused;
}

// 从2个区间内随机一个数字
- (CGFloat)getRandomNumberFromSection1:(NSInteger)from1 to1:(NSInteger)to1 from2:(NSInteger)from2 to2:(NSInteger)to2{
    CGFloat random1 = [self getRandomNumber:from1 to:to1];
    CGFloat random2 = [self getRandomNumber:from2 to:to2];
    NSArray * array = @[@(random1), @(random2)];
    return [array[arc4random() % 2] floatValue];
}

// 从一个区间内随机一个数字
- (CGFloat)getRandomNumber:(NSInteger)from to:(NSInteger)to{
    return (from + (arc4random() % (to - from + 1)));
}

@end
