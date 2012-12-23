//
//  UIWindow+iOS.h
//  LearnClock
//
//  Created by Sarah Lensing on 11/13/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (iOS)

- (void)showWithAnimation;
- (void)showWithAnimation:(void (^)(BOOL finished))completion;
- (void)hideWithAnimation;
- (void)hideWithAnimation:(void (^)(BOOL finished))completion;

@end
