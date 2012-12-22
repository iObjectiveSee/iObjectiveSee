//
//  UIWindow+iOS.m
//  LearnClock
//
//  Created by Sarah Lensing on 11/13/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import "UIWindow+iOS.h"

@implementation UIWindow (iOS)

- (void)showWithAnimation:(void (^)(BOOL finished))completion {
    self.hidden = NO;
    self.alpha = 0.0f;
    [UIView animateWithDuration:1.0 delay:0.0f options:UIViewAnimationCurveEaseInOut animations:^{
        self.alpha = 1.0;
    } completion:completion];
}

- (void)showWithAnimation {
    [self showWithAnimation:nil];
}

- (void)hideWithAnimation:(void (^)(BOOL finished))completion {
    self.alpha = 1.0f;
    self.hidden = NO;
    [UIView animateWithDuration:.3 delay:0.0f options:UIViewAnimationCurveEaseInOut animations:^{
        self.alpha = 0.0;
    } completion:completion];
}

- (void)hideWithAnimation {
    [self hideWithAnimation:^(BOOL completion) {
        self.hidden = YES;
    }];
}

@end
