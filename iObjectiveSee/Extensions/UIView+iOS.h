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

@property (nonatomic) CGFloat leftBounds;
@property (nonatomic) CGFloat topBounds;
@property (nonatomic) CGFloat rightBounds;
@property (nonatomic) CGFloat bottomBounds;
@property (nonatomic) CGFloat widthBounds;
@property (nonatomic) CGFloat heightBounds;

- (void)setOrigin:(CGPoint)inOrigin;
- (void)setSize:(CGSize)inSize; 
- (void)removeAllSubviews; 
- (UIViewController *)viewController;
- (void)align;
- (void)centerV;
- (void)centerH;
- (void)addShadow;
- (void)removeShadow;
- (void)showBounce;
- (void)drawGradiant:(CGRect)rect colors:(NSArray *)inColors;
- (void)fadeOut;
- (void)fadeIn;
- (void)fadeOut:(CGFloat)duration;
- (void)fadeIn:(CGFloat)duration;

- (UIImage *)snapshot;
- (UIImage *)snapshot:(CGRect)rect;
- (UIImage *)snapshot:(CGRect)rect quality:(float)quality;
- (UIImage *)snapshot:(CGRect)rect quality:(float)quality opaque:(BOOL)opaque;

@end
