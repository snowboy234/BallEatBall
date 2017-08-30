//
//  TWEge.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWEge.h"

@implementation TWEge

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"ege"];
        
    }
    return self;
}

- (void)startMoveing{
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

- (void)moveBall{
    BOOL paused = [self.delegate checkGameStatus];
    if (!paused) {
        
        self.tw_centerY++;
        
        if ((NSInteger)(self.tw_y + self.tw_height) == DangbanY) {
            // 检查位置
            [self.delegate checkPosition:self];
        }
        
        // 检查是否被抓住
        if (self.caught) {
            // 抓住移除
            [self.myTimer invalidate];
            [self.delegate removeMe:self];
        } else {
            if (self.tw_y > TWScreenHeight) {
                [self.myTimer invalidate];
                [self.delegate removeMe:self];
            }
        }
    }
}


@end
