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
        self.backgroundColor = [UIColor colorWithRed:0.192f green:0.224f blue:0.251f alpha:1.00f];
    }
    return self;
}

- (void)checkIfCaught:(CGRect)frame{
    
    // 计算传来的frame的中心点
    CGPoint ballCenter = CGPointMake(frame.origin.x + frame.size.width * 0.5, frame.origin.y + frame.size.height * 0.5);
    TWLog(@"传来小球的中心点%@",NSStringFromCGPoint(ballCenter));
    
    CGPoint center = CGPointMake(self.tw_x + self.tw_width * 0.5, self.tw_y + self.tw_height * 0.5);
    TWLog(@"自己的中心点%@",NSStringFromCGPoint(ballCenter));

    // 比较大小
    
    // 
    
//    if (<#condition#>) {
//        <#statements#>
//    }
//    
    
    
    
    
    
}

@end
