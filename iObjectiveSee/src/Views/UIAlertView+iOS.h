//
//  UIAlertView+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/18/12.
//
//

#import <UIKit/UIKit.h>
#import "iOSBlockDefinitions.h"

@interface UIAlertView (iOS)

+ (UIAlertView*)alertWithTitle:(NSString*) title
                       message:(NSString*) message
             cancelButtonTitle:(NSString*) cancelButtonTitle
             otherButtonTitles:(NSArray*) otherButtons
                     onDismiss:(void (^)(int buttonIndex, UIAlertView *alertView)) dismissed
                      onCancel:(CancelBlock) cancelled;

@end
