//
//  UIImage+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "UIImage+iOS.h"
#import <QuartzCore/QuartzCore.h>
#import "CGGeometry+iOS.h"

@implementation UIImage (iOS)

+ (UIImage *)screenshot {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIGraphicsBeginImageContext(window.frame.size);
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];;
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

- (UIImage *) scaleToSize: (CGSize)size {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
    CGContextClearRect(context, CGRectMake(0, 0, size.width, size.height));
    if(self.imageOrientation == UIImageOrientationRight) {
        CGContextRotateCTM(context, -M_PI_2);
        CGContextTranslateCTM(context, -size.height, 0.0f);
        CGContextDrawImage(context, CGRectMake(0, 0, size.height, size.width), self.CGImage);
    }
    else {
        CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), self.CGImage);
    }
    CGImageRef scaledImage=CGBitmapContextCreateImage(context);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    UIImage *image = [UIImage imageWithCGImage: scaledImage];
    CGImageRelease(scaledImage);
    return image;
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees {
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    //   // Rotate the image context
    CGContextRotateCTM(bitmap, DegreesToRadians(degrees));
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)decompressImage:(UIImage *)image {
    CGImageRef imageRef = [image CGImage];
    CGRect rect = CGRectMake(0.f, 0.f, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                       rect.size.width,
                                                       rect.size.height,
                                                       CGImageGetBitsPerComponent(imageRef),
                                                       CGImageGetBytesPerRow(imageRef),
                                                       CGImageGetColorSpace(imageRef),
                                                       kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little
                                                       );
    //kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Little are the bit flags required so that the main thread doesn't have any conversions to do.
    CGContextDrawImage(bitmapContext, rect, imageRef);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(bitmapContext);
    UIImage* decompressedImage = [[UIImage alloc] initWithCGImage: decompressedImageRef];
    CGImageRelease(decompressedImageRef);
    CGContextRelease(bitmapContext);
    return decompressedImage;
}

+ (UIImage*)decompressedContentsOfFile:(NSString*)path {
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    return [UIImage decompressImage:image];
}

- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, self.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
