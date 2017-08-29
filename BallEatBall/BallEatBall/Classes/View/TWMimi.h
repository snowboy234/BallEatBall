//
//  TWMimi.h
//  BallEatBall
//
//  Created by 田伟 on 2017/8/28.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TWMimiDelegate <NSObject>
- (void)gameoverNoti;
@end

@interface TWMimi : UIImageView
@property (nonatomic, weak) id <TWMimiDelegate> delegate;
- (BOOL)checkIfCaught:(CGRect)frame;
@end
