//
//  TWEge.h
//  BallEatBall
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TWEge;

@protocol TWEgeDelegate <NSObject>
-(void)checkPosition:(TWEge *)ball;  // 检查位置
-(void)removeMe:(TWEge *)ball;
-(BOOL)checkGameStatus;
@end

@interface TWEge : UIImageView
@property (nonatomic, weak) id <TWEgeDelegate> delegate;
// 是否被抓住
@property (nonatomic, assign) BOOL caught;
@property (nonatomic, strong) NSTimer * myTimer;
- (void)startMoveing;
@end
