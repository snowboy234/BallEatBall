//
//  TWBall.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWBall.h"

@interface TWBall ()
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@end

@implementation TWBall

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = self.bounds.size.width * 0.5;
        self.layer.masksToBounds = YES;
        self.backgroundColor = TWRandomColor;
        
        _x = [self getRandomNumberFromSection1:-TWScreenWidth to1:0 - self.tw_width from2:TWScreenWidth + self.tw_width to2:TWScreenWidth * 2];
        _y = [self getRandomNumberFromSection1:-TWScreenHeight to1:0 - self.tw_height from2:TWScreenHeight + self.tw_height to2:TWScreenHeight * 2];
    }
    return self;
}

- (void)startMoveing{
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

#define Distance 0.2

- (void)moveBall{
    BOOL paused = [self.delegate checkGameStatus];
    if (!paused) {
        // 初始化位置——变化中
        CGPoint start = CGPointMake(self.tw_centerX, self.tw_centerY);
        CGPoint end = CGPointMake(_x, _y);
        
        if (start.x >= end.x && start.y >= end.y) {
            //向左上角移动
            self.center = CGPointMake(self.center.x - Distance, self.center.y - Distance);
        } else if (start.x <= end.x && start.y >= end.y) {
            //向右上角移动
            self.center = CGPointMake(self.center.x + Distance, self.center.y - Distance);
        } else if (start.x >= end.x && start.y <= end.y) {
            //向左下角移动
            self.center = CGPointMake(self.center.x - Distance, self.center.y + Distance);
        } else if (start.x <= end.x && start.y <= end.y) {
            //向右下角移动
            self.center = CGPointMake(self.center.x + Distance, self.center.y + Distance);
        }
        
        // 检查位置
        [self.delegate checkPosition:self];
        // 检查是否被抓住
        if (self.caught) {
            // 抓住移除
            [self.myTimer invalidate];
            [self.delegate removeMe:self];
        } else {
            // 超出边界移除
            if (self.tw_x > TWScreenWidth || self.tw_y > TWScreenHeight || self.tw_x < -self.tw_width || self.tw_y < -self.tw_height) {
                [self.myTimer invalidate];
                [self.delegate removeMe:self];
                TWLog(@"超出边界移除");
            }
        }
    }
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
