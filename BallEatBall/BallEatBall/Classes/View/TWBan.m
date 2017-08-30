//
//  TWBan.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWBan.h"

@implementation TWBan

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)setX:(CGFloat)x{
    _x = x;
    self.tw_x = x;
}

- (BOOL)checkIfCaught:(CGRect)frame{
    // 传来的x坐标
    CGFloat x = frame.origin.x;
    if (x == self.tw_x) {
        if ([_delegate respondsToSelector:@selector(gameoverNoti)]) {
            [_delegate gameoverNoti];
        }
        return YES;
    }
    return NO;
}


@end
