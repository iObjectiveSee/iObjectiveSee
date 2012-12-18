//
//  UIAlertView+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/18/12.
//
//

#import "UIAlertView+iOS.h"

static DismissBlock _dismissBlock;
static CancelBlock _cancelBlock;

@implementation UIAlertView (iOS)

+ (UIAlertView*)alertWithTitle:(NSString*)title
                       message:(NSString*)message
             cancelButtonTitle:(NSString*)cancelButtonTitle
             otherButtonTitles:(NSArray*)otherButtons
                     onDismiss:(void (^)(int buttonIndex, UIAlertView *alertView)) dismissed
                      onCancel:(CancelBlock)cancelled {
    _cancelBlock  = [cancelled copy];
    _dismissBlock  = [dismissed copy];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[self class]
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:nil];
    for(NSString *buttonTitle in otherButtons)
        [alert addButtonWithTitle:buttonTitle];
    [alert show];
    return alert;
}

+ (void)alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
	if(buttonIndex == [alertView cancelButtonIndex]) {
		_cancelBlock();
	}
    else {
        _dismissBlock(buttonIndex - 1, alertView); // cancel button is button 0
    }
}


@end
