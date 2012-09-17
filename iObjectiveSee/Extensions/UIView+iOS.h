//
//  UIView+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(iOS)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

- (void)setOrigin:(CGPoint)inOrigin;
- (void)setSize:(CGSize)inSize; 
- (void)removeAllSubviews; 
- (UIViewController *)viewController;
- (void)align;
- (void)centerV;
- (void)addShadow;
- (void)removeShadow;
- (void)showBounce;
- (void)drawGradiant:(CGRect)rect colors:(NSArray *)inColors;

@end
