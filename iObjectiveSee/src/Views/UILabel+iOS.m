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
    NSDictionary *attributDict = @{NSFontAttributeName: self.font};
    CGRect tmpRect = [self.text boundingRectWithSize:inSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributDict context:nil];
    
	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, tmpRect.size.width, tmpRect.size.height)];
}

- (void)sizeToFitSizeMaintainWidth:(CGSize)inSize {
    NSDictionary *attributDict = @{NSFontAttributeName: self.font};
	CGRect tmpRect = [self.text boundingRectWithSize:inSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributDict context:nil];
	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, tmpRect.size.height)];
}

- (void)sizeToFitSizeMaintainHeight:(CGSize)inSize {
    NSDictionary *attributDict = @{NSFontAttributeName: self.font};
    CGRect tmpRect = [self.text boundingRectWithSize:inSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributDict context:nil];
	[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, tmpRect.size.width, self.frame.size.height)];
}

@end
