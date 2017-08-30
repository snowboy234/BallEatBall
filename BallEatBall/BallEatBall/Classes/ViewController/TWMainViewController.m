//
//  TWMainViewController.m
//  BallEatBall
//
//  Created by 田伟 on 2017/8/30.
//  Copyright © 2017年 田伟. All rights reserved.
//

#import "TWMainViewController.h"

@interface TWMainViewController ()

@end

@implementation TWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bgImageView];
}

- (void)bgImageView{
    UIImageView * bg = [[UIImageView alloc]initWithFrame:self.view.frame];
    bg.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:bg];
}



@end
