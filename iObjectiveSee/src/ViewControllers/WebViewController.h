//
//  WebViewController.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 3/11/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate, UIAlertViewDelegate> {
    NSString *_urlString;
    UIWebView *_webView;
    UIToolbar *_toolBar;
    UIBarButtonItem *_goBackButton;
    UIBarButtonItem *_goForwardButton;
    UIActivityIndicatorView *_loadingIndicator;
}

@property (nonatomic, copy) NSString *urlString;

- (id)initWithURLString:(NSString *)URLString;

@end
