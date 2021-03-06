//
//  UIView+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+iOS.h"
#import <QuartzCore/QuartzCore.h>
#import "UIDevice+iOS.h"
#import "CGGeometry+iOS.h"

@implementation UIView(iOS)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)leftBounds {
    return self.bounds.origin.x;
}

- (void)setLeftBounds:(CGFloat)x {
    CGRect bounds = self.bounds;
    bounds.origin.x = x;
    self.bounds = bounds;
}

- (CGFloat)topBounds {
    return self.bounds.origin.y;
}

- (void)setTopBounds:(CGFloat)y {
    CGRect bounds = self.bounds;
    bounds.origin.y = y;
    self.bounds = bounds;
}

- (CGFloat)rightBounds {
    return self.bounds.origin.x + self.bounds.size.width;
}

- (void)setRightBounds:(CGFloat)right {
    CGRect bounds = self.bounds;
    bounds.origin.x = right - bounds.size.width;
    self.bounds = bounds;
}

- (CGFloat)bottomBounds {
    return self.bounds.origin.y + self.bounds.size.height;
}

- (void)setBottomBounds:(CGFloat)bottom {
    CGRect bounds = self.bounds;
    bounds.origin.y = bottom - bounds.size.height;
    self.bounds = bounds;
}

- (CGFloat)widthBounds {
    return self.bounds.size.width;
}

- (void)setWidthBounds:(CGFloat)width {
    CGRect bounds = self.bounds;
    bounds.size.width = width;
    self.bounds = bounds;
}

- (CGFloat)heightBounds {
    return self.bounds.size.height;
}

- (void)setHeightBounds:(CGFloat)height {
    CGRect bounds = self.bounds;
    bounds.size.height = height;
    self.bounds = bounds;
}

- (void)setOrigin:(CGPoint)inOrigin {
    [self setFrame:CGRectMake(inOrigin.x, inOrigin.y, self.frame.size.width, self.frame.size.height)];
}

- (void)setSize:(CGSize)inSize {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, inSize.width, inSize.height)];
}

- (void)removeAllSubviews {
    for (UIView *tmpView in [self subviews]) {
        [tmpView removeFromSuperview];
    }
}

- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)align {
    [self setFrame:CGRectMake((int)self.frame.origin.x,
                              (int)self.frame.origin.y,
                              (int)self.frame.size.width,
                              (int)self.frame.size.height)];
}

- (void)centerV {
    if (!self.superview) {
        return;
    }
    self.top = (self.superview.height - self.height)/2;
}

- (void)centerH {
    if (!self.superview) {
        return;
    }
    self.left = (self.superview.width - self.width)/2;
}

- (void)centerHV {
    if (!self.superview) {
        return;
    }
    self.top = (self.superview.height - self.height)/2;
    self.left = (self.superview.width - self.width)/2;
}

- (void)addShadow {
    if (self.layer.shadowOpacity == 0 && self.frame.size.width > 0) {
        self.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:.2] CGColor];
        self.layer.shadowRadius = 10.0f;
        
        CGRect path = CGRectMake(-3, -.5, self.frame.size.width + 6, self.frame.size.height + 6.5);
        self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:path] CGPath];
        
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
        anim.fromValue = [NSNumber numberWithFloat:0.0];
        anim.toValue = [NSNumber numberWithFloat:1.0];
        anim.duration = .2;
        [self.layer addAnimation:anim forKey:@"shadowOpacity"];
        self.layer.shadowOpacity = 1.0;
    }
}

- (void)removeShadow {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    anim.fromValue = [NSNumber numberWithFloat:1.0];
    anim.toValue = [NSNumber numberWithFloat:0.0];
    anim.duration = .2;
    [self.layer addAnimation:anim forKey:@"shadowOpacity"];
    self.layer.shadowOpacity = 0.0;
}

- (void)showBounce {
    self.alpha = 0;
    self.hidden = NO;
    [UIView animateWithDuration:0.1 animations:^{self.alpha = 1.0;}];
    self.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0);
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.5],
                              [NSNumber numberWithFloat:1.1],
                              [NSNumber numberWithFloat:0.8],
                              [NSNumber numberWithFloat:1.0], nil];
    bounceAnimation.duration = 0.3;
    bounceAnimation.removedOnCompletion = NO;
    [self.layer addAnimation:bounceAnimation forKey:@"bounce"];
    
    self.layer.transform = CATransform3DIdentity;
}

- (void)drawGradiant:(CGRect)rect colors:(NSArray *)inColors {
    
    CGFloat colors[[inColors count]*4];
    int i = 0;
    for (UIColor *item in inColors) {
        CGFloat newComponents[4] = {};
        memcpy(newComponents, CGColorGetComponents([item CGColor]), sizeof(newComponents));
        colors[i++] = newComponents[0];
        colors[i++] = newComponents[1];
        colors[i++] = newComponents[2];
        colors[i++] = newComponents[3];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    CGContextSaveGState(context);
    CGContextClipToRect(context, rect);
    CGPoint start = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint end = CGPointMake(rect.origin.x, rect.size.height);
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation);
}

- (void)fadeOut:(CGFloat)duration {
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    }];
}

- (void)fadeOut {
    [self fadeOut:0.3];
}

- (void)fadeIn:(CGFloat)duration {
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    }];
}

- (void)fadeIn {
    [self fadeIn:0.3];
}

- (UIImage *)snapshot:(CGRect)rect quality:(float)quality opaque:(BOOL)opaque {
    if (rect.size.width <= 0 || rect.size.height <= 0) {
        return nil;
    }
    // Get Image
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, quality);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, -rect.origin.x, -rect.origin.y);
    CGContextClipToRect(ctx, CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
    
    [self.layer renderInContext:ctx];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}

- (UIImage *)snapshot:(CGRect)rect {
    return [self snapshot:rect quality:[UIScreen mainScreen].scale];
}

- (UIImage *)snapshot {
    return [self snapshot:CGRectMake(0, 0, self.width, self.height)];
}

- (UIImage *)snapshot:(CGRect)rect quality:(float)quality {
    return [self snapshot:rect quality:quality opaque:NO];
}

+ (CGFloat)keyBoardHeightForCurrentOrientation {
    switch ([UIApplication sharedApplication].statusBarOrientation) {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown: {
            if ([UIDevice isIphone]) {
                return kiOSPortraitiPhoneKeyBoardHeight;
            }
            return kiOSPortraitiPadKeyBoardHeight;
            break;
        }
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            if ([UIDevice isIphone]) {
                return kiOSLandscapeiPhoneKeyBoardHeight;
            }
            return kiOSLandscapeiPadKeyBoardHeight;
            break;
        default:
            if ([UIDevice isIphone]) {
                return kiOSPortraitiPhoneKeyBoardHeight;
            }
            return kiOSPortraitiPadKeyBoardHeight;
            break;
    }
}

@end
