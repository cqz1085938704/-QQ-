//
//  SliderHeaderView.m
//  qq仿
//
//  Created by hsbc on 15/7/14.
//  Copyright (c) 2015年 Zp. All rights reserved.
//

#import "SliderHeaderView.h"

@implementation SliderHeaderView
+ (instancetype)sliderHeaderView {
    SliderHeaderView *slider = [[[NSBundle mainBundle] loadNibNamed:@"SliderHeaderView" owner:nil options:nil]lastObject];
    return slider;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = 30;
}
@end
