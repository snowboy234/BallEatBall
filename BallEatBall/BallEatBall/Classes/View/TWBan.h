//
//  TWBan.h
//  BallEatBall
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TWBanDelegate <NSObject>
- (void)gameoverNoti;
@end

@interface TWBan : UIImageView
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, weak) id <TWBanDelegate> delegate;
- (BOOL)checkIfCaught:(CGRect)frame;
@end
