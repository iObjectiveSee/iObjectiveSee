//
//  UILabel+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "UILabel+iOS.h"
#import "UIView+iOS.h"

@implementation UILabel (iOS)

- (void)sizeToFitSize:(CGSize)inSize {
	CGSize tmpSize = [self.text sizeWithFont:self.font constrainedToSize:inSize lineBreakMode:self.lineBreakMode];
	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, tmpSize.width, tmpSize.height)];
}

- (void)sizeToFitSizeMaintainWidth:(CGSize)inSize {
	CGSize tmpSize = [self.text sizeWithFont:self.font constrainedToSize:inSize lineBreakMode:self.lineBreakMode];
	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, tmpSize.height)];
}

- (void)sizeToFitSizeMaintainHeight:(CGSize)inSize {
	CGSize tmpSize = [self.text sizeWithFont:self.font constrainedToSize:inSize lineBreakMode:self.lineBreakMode];
	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, tmpSize.width, self.frame.size.height)];
}

@end
