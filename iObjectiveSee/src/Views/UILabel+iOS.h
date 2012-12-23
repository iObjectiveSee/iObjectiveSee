//
//  UILabel+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (iOS)

- (void)sizeToFitSize:(CGSize)inSize;
- (void)sizeToFitSizeMaintainWidth:(CGSize)inSize;
- (void)sizeToFitSizeMaintainHeight:(CGSize)inSize;

@end
