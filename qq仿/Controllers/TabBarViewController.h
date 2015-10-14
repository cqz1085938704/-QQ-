//
//  TabBarViewController.h
//  qq仿
//
//  Created by hsbc on 15/7/10.
//  Copyright (c) 2015年 Zp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UITabBarController

@property (nonatomic,copy)void (^moveSliderVc)(CGFloat,BOOL);

@end
