//
//  UIActionSheet+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "UIActionSheet+iOS.h"

static DismissBlock _dismissBlock;
static CancelBlock _cancelBlock;

@implementation UIActionSheet (iOS)

+ (UIActionSheet *) actionSheetWithTitle:(NSString*) title
                                 message:(NSString*) message
                                 buttons:(NSArray*) buttonTitles
                              showInView:(UIView*) view
                               onDismiss:(DismissBlock) dismissed
                                onCancel:(CancelBlock) cancelled {
    return [UIActionSheet actionSheetWithTitle:title
                                       message:message
                        destructiveButtonTitle:nil
                                       buttons:buttonTitles
                                    showInView:view
                                     onDismiss:dismissed
                                      onCancel:cancelled];
}

+ (UIActionSheet *) actionSheetWithTitle:(NSString*) title
                                 message:(NSString*) message
                  destructiveButtonTitle:(NSString*) destructiveButtonTitle
                                 buttons:(NSArray*) buttonTitles
                              showInView:(UIView*) view
                               onDismiss:(DismissBlock) dismissed
                                onCancel:(CancelBlock) cancelled {
    _cancelBlock  = [cancelled copy];
    _dismissBlock  = [dismissed copy];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                             delegate:(id<UIActionSheetDelegate>)[self class]
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:destructiveButtonTitle
                                                    otherButtonTitles:nil];
    
    for(NSString* thisButtonTitle in buttonTitles)
        [actionSheet addButtonWithTitle:thisButtonTitle];
    
    [actionSheet addButtonWithTitle:NSLocalizedString(@"Cancel", @"")];
    actionSheet.cancelButtonIndex = [buttonTitles count];
    
    if(destructiveButtonTitle)
        actionSheet.cancelButtonIndex ++;
    if([view isKindOfClass:[UIView class]])
        [actionSheet showInView:view];
    if([view isKindOfClass:[UITabBar class]])
        [actionSheet showFromTabBar:(UITabBar*) view];
    if([view isKindOfClass:[UIBarButtonItem class]])
        [actionSheet showFromBarButtonItem:(UIBarButtonItem*) view animated:YES];
    return actionSheet;
}

+ (void)actionSheet:(UIActionSheet*) actionSheet didDismissWithButtonIndex:(NSInteger) buttonIndex {
	if(buttonIndex == [actionSheet cancelButtonIndex]) {
        if (_cancelBlock) {
            _cancelBlock();
        }
	}
    else {
        if (_dismissBlock) {
            _dismissBlock(buttonIndex, actionSheet);
        }
    }
}


@end
