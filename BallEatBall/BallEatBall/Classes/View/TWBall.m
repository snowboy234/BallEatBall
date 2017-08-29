//
//  TWBall.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWBall.h"

@interface TWBall ()
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGFloat speed;
@end

@implementation TWBall

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _startPoint = CGPointMake(frame.origin.x, frame.origin.y);
        _speed = (1 + arc4random() % 99) / 50.0;
        self.layer.cornerRadius = self.bounds.size.width * 0.5;
        self.layer.masksToBounds = YES;
        self.backgroundColor = TWRandomColor;
    }
    return self;
}

- (void)startMoveing{
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

- (void)moveBall{
    BOOL paused = [self.delegate checkGameStatus];
    if (!paused) {
        CGPoint start = _startPoint;
        CGPoint end = CGPointMake(-start.x, -start.y);
        
        if (start.x <= end.x && start.y >= end.y) {
            //向左上角移动
            self.center = CGPointMake(self.center.x - _speed, self.center.y - _speed);
        } else if (start.x >= end.x && start.y >= end.y) {
            //向右上角移动
            self.center = CGPointMake(self.center.x + _speed, self.center.y - _speed);
        } else if (start.x <= end.x && start.y <= end.y) {
            //向右下角移动
            self.center = CGPointMake(self.center.x + _speed, self.center.y + _speed);
        } else if (start.x >= end.x && start.y <= end.y) {
            //向左下角移动
            self.center = CGPointMake(self.center.x - _speed, self.center.y + _speed);
        }

        // 检查位置
        [self.delegate checkPosition:self];
        // 检查是否被抓住
        if (self.caught) {
            // 抓住移除
            [self.myTimer invalidate];
            [self.delegate removeMe:self];
        } else {
            if (self.tw_x < TWBallMinWidth || self.tw_x > TWBallMaxWidth || self.tw_y < TWBallMinHeight || self.tw_y > TWBallMaxHeight) {
                [self.myTimer invalidate];
                [self.delegate removeMe:self];
            }
        }
    }
}

@end
