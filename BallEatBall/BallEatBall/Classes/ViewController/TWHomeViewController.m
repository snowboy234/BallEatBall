//
//  TWHomeViewController.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWHomeViewController.h"
#import "TWBall.h"

@interface TWHomeViewController ()<TWBallDelegate>

@end

@implementation TWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TWRandomColor;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(createBalls) userInfo:nil repeats:YES];
}

- (void)createBalls{
    if (self.view.subviews.count <= 10) {
        for (NSInteger i = 0; i < 5; i++) {
            CGFloat wh = [self getRandomNumber:0 to:TWScreenWidth / 3];
            TWBall * ball = [[TWBall alloc]initWithFrame:CGRectMake([self getRandomNumber:0 to:TWScreenWidth], [self getRandomNumber:0 to:TWScreenHeight], wh, wh)];
            ball.delegate = self;
            [ball startMoveing];
            [self.view addSubview:ball];
        }
    }
}

- (void)checkPosition:(id)ball{
    
}

- (void)removeMe:(id)ball{
    [ball removeFromSuperview];
}

- (BOOL)checkGameStatus{
    return NO;
}

- (NSInteger)getRandomNumber:(int)from to:(int)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}


@end
