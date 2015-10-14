//
//  ViewController.m
//  qq仿
//
//  Created by hsbc on 15/7/10.
//  Copyright (c) 2015年 Zp. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"
#import "SliderViewController.h"

@interface ViewController ()

@property (nonatomic,strong) SliderViewController *sliderVc;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initSetUp];
}

- (void)initSetUp
{
    
    self.view.backgroundColor = [UIColor colorWithRed:38/255.0 green:41/255.0 blue:46/255.0 alpha:1.0];
    CGSize size = self.view.bounds.size;
    
    // 1:添加头部背景图片
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"sidebar_bg.jpg"];
    imageView.frame = CGRectMake(0, 0, size.width, 120);
    [self.view addSubview:imageView];
    
    // 2:添加菜单视图
    
    SliderViewController *sliderVc= [[SliderViewController alloc] init];
    sliderVc.view.frame = CGRectMake(-70, 0, size.width, size.height);
    sliderVc.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [self addChildViewController:sliderVc];
    [self.view addSubview:sliderVc.view];
    self.sliderVc = sliderVc;
    
    // 3:添加主视图
    TabBarViewController *tabBar = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    
    tabBar.moveSliderVc = ^(CGFloat transX,BOOL animation)
    {
        
        if (transX>=0&&transX<=280&&!animation)
        {
            
            CGFloat scal = 0.8+transX/280*0.2;
            CGAffineTransform tranlateForm  = CGAffineTransformMakeTranslation(transX*0.25, 0);
            CGAffineTransform scaleForm  = CGAffineTransformMakeScale(scal, scal);
            self.sliderVc.view.transform = CGAffineTransformConcat(tranlateForm, scaleForm);
        }
        
        if (animation&&transX>=100)
        {
            [UIView animateWithDuration:0.3 animations:^{
                CGAffineTransform tranlateForm  = CGAffineTransformMakeTranslation(70, 0);
                CGAffineTransform scaleForm  = CGAffineTransformMakeScale(1.0, 1.0);
                self.sliderVc.view.transform = CGAffineTransformConcat(tranlateForm, scaleForm);
            } completion:nil];
        }
        else if(animation)
        {
            [UIView animateWithDuration:0.3 animations:^{
                CGAffineTransform tranlateForm  = CGAffineTransformMakeTranslation(-70, 0);
                CGAffineTransform scaleForm  = CGAffineTransformMakeScale(0.8, 0.8);
                self.sliderVc.view.transform = CGAffineTransformConcat(tranlateForm, scaleForm);
            } completion:nil];
        }
    };
    
    [self addChildViewController:tabBar];
    [self.view addSubview:tabBar.view];
}

@end
