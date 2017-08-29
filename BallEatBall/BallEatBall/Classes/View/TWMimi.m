//
//  TWMimi.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWMimi.h"

@implementation TWMimi

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = self.bounds.size.width * 0.5;
        self.layer.masksToBounds = YES;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor colorWithRed:0.192f green:0.224f blue:0.251f alpha:1.00f];
    }
    return self;
}

- (BOOL)checkIfCaught:(CGRect)frame{
    // 1判断是否碰触 -- 计算传来的frame的中心点
    CGPoint ballCenter = CGPointMake(frame.origin.x + frame.size.width * 0.5, frame.origin.y + frame.size.height * 0.5);
//    TWLog(@"传来小球的中心点%@",NSStringFromCGPoint(ballCenter));
    CGPoint center = CGPointMake(self.tw_x + self.tw_width * 0.5, self.tw_y + self.tw_height * 0.5);
//    TWLog(@"自己的中心点%@",NSStringFromCGPoint(center));
    // 2个中心点之间的距离小于小球的半径
    CGFloat x = fabs(ballCenter.x - center.x);
    CGFloat y = fabs(ballCenter.y - center.y);
    CGFloat distance = sqrtf((x) * (x) + (y) * (y));
    TWLog(@"distance -- %f",distance);
    if (distance <= self.tw_width * 0.5) {
        // 表示已经触碰，比较大小
        if (frame.size.width <= self.tw_width) {
            // 碰触到小的球
            NSLog(@"碰触到小的球");
            return YES;
        } else {
            // 碰触到大的球
            if ([self.delegate respondsToSelector:@selector(gameoverNoti)]) {
                [self.delegate gameoverNoti];
            }
        }
    }
//    NSLog(@"未触碰");
    return NO;
}

@end
