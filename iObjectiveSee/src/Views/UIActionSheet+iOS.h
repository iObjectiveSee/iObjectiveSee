//
//  UIActionSheet+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <UIKit/UIKit.h>
#import "iOSBlockDefinitions.h"

@interface UIActionSheet (iOS)

+ (UIActionSheet *)actionSheetWithTitle:(NSString*) title
                                message:(NSString*) message
                                buttons:(NSArray*) buttonTitles
                             showInView:(UIView*) view
                              onDismiss:(DismissBlock) dismissed
                               onCancel:(CancelBlock) cancelled;


+ (UIActionSheet *)actionSheetWithTitle:(NSString*) title
                                message:(NSString*) message
                 destructiveButtonTitle:(NSString*) destructiveButtonTitle
                                buttons:(NSArray*) buttonTitles
                             showInView:(UIView*) view
                              onDismiss:(DismissBlock) dismissed
                               onCancel:(CancelBlock) cancelled;
@end
