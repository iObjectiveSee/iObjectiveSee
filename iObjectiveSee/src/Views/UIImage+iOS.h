//
//  UIImage+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (iOS)

+ (UIImage *)screenshot;
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
+ (UIImage *)decompressImage:(UIImage *)image;
+ (UIImage*)decompressedContentsOfFile:(NSString*)path;
- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha;

@end
