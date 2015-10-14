//
//  SliderBottomView.m
//  qq仿
//
//  Created by hsbc on 15/7/14.
//  Copyright (c) 2015年 Zp. All rights reserved.
//

#import "SliderBottomView.h"

@implementation SliderBottomView

+ (instancetype) sliderBottomView{
    SliderBottomView *slider = [[[NSBundle mainBundle] loadNibNamed:@"SliderBottomView" owner:nil options:nil]lastObject];
    return slider;
}

@end
