//
//  Score.m
//  Game
//
//  Created by Mac on 6/11/15.
//  Copyright (c) 2015 MAC. All rights reserved.
//

#import "Score.h"

@implementation Score

+(id)initScore{
    Score *score = [Score new];
    score.points = 0;
    return score;
}

-(id)addPoints{
    self.points += 1;
    return self;
}


@end
