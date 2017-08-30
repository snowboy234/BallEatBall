//
//  Score.h
//  Game
//
//  Created by Mac on 6/11/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject
@property int points;
+(id)initScore;
-(id)addPoints;
@end
