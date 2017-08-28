//
//  TWBall.h
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TWBallDelegate <NSObject>
-(void)checkPosition:(id)ball;  // 检查位置
-(void)removeMe:(id)ball;
-(BOOL)checkGameStatus;
@end

@interface TWBall : UIImageView

@property (nonatomic, weak) id <TWBallDelegate> delegate;
// 是否被抓住
@property (nonatomic, assign) BOOL caught;
@property (nonatomic, strong) NSTimer * myTimer;

- (void)startMoveing;

@end
