//
//  TabBarViewController.m
//  qq仿
//
//  Created by hsbc on 15/7/10.
//  Copyright (c) 2015年 Zp. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.view addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)recognizer
{
    static CGFloat currentTranslateX ;
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        currentTranslateX = recognizer.view.transform.tx;
    }
    
    if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        CGFloat transX = 0;
        CGPoint translation = [recognizer translationInView:recognizer.view];
        transX = translation.x+currentTranslateX;
        NSLog(@"移动----%f",transX);
        CGFloat scal = 0;
        if (transX>=0&&transX<=280)
        {
            scal = 1-transX/280*0.2;
            CGAffineTransform tranlateForm  = CGAffineTransformMakeTranslation(transX, 0);
            CGAffineTransform scaleForm  = CGAffineTransformMakeScale(scal, scal);
            recognizer.view.transform = CGAffineTransformConcat(tranlateForm, scaleForm);
            
            if (self.moveSliderVc)
            {
                self.moveSliderVc(transX,NO);
            }
        }
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGFloat panX = [recognizer translationInView:recognizer.view].x;
        CGFloat finalX = currentTranslateX + panX;
        NSLog(@"最终+++%f",finalX);
        if (finalX>=100)
        {
            [UIView animateWithDuration:0.3 animations:^{
                CGAffineTransform tranlateForm  = CGAffineTransformMakeTranslation(280, 0);
                CGAffineTransform scaleForm  = CGAffineTransformMakeScale(0.8, 0.8);
                recognizer.view.transform = CGAffineTransformConcat(tranlateForm, scaleForm);
               } completion:^(BOOL finished) {
            }];
            if (self.moveSliderVc)
            {
                self.moveSliderVc(finalX,YES);
            }
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                recognizer.view.transform = CGAffineTransformIdentity;
               } completion:^(BOOL finished) {
            }];
            if (self.moveSliderVc)
            {
                self.moveSliderVc(finalX,YES);
            }
        }
   }
}

- (void) Xcode7
{
    
}

@end
