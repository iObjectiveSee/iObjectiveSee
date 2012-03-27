//
//  WebViewController.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 3/11/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import "WebViewController.h"
#import "UIViewController+iOS.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize urlString = _urlString;
//@synthesize webView = _webView;
//@synthesize toolBar = _toolBar;
//@synthesize goBackButton = _goBackButton;
//@synthesize goForwardButton = _goForwardButton;
//@synthesize loadingIndicator = _loadingIndicator;

#define toolBarHeight 44.0f

- (id)initWithURLString:(NSString *)URLString {
    self = [super init];
    if (self) {
        self.urlString = URLString;
    }
    return self;
}

- (void)setupView {
    CGRect frame = [self maximumUsableFrame];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.view = view;
}

- (void)setupWebView {
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-toolBarHeight)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
}

- (void)setupLoadingIndicator {
    _loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
}

- (void)setupToolBar {
    UIImage *backImage = [UIImage imageNamed:@"images/webview/backButton.png"]; 
    _goBackButton = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target: self action:@selector(goBack)]; 
    _goForwardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemPlay target: self action:@selector(goForward)];
    UIBarButtonItem *loadingBtn = [[UIBarButtonItem alloc]initWithCustomView:_loadingIndicator];
    UIBarButtonItem *div = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.height-toolBarHeight, self.view.width, toolBarHeight)];
    _toolBar.items = [NSArray arrayWithObjects:_goBackButton, div, _goForwardButton, div, div, div, loadingBtn, nil];
    [self.view addSubview:_toolBar];
}

- (void)showLoading {
    [_loadingIndicator startAnimating];
}

- (void)hideLoading {
    [_loadingIndicator stopAnimating];
}

#pragma mark - View lifecycle
- (void)loadView {
    [self setupView];
    [self setupWebView];
    [self setupLoadingIndicator];
    [self setupToolBar];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
    [self showLoading];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    _webView = nil;
    _toolBar = nil;
    _goBackButton = nil;
    _goForwardButton = nil;
    _loadingIndicator = nil;
}
- (void)goBack {
    
	if ([_webView canGoBack]) {
		[_webView goBack];
	}
}

- (void)goForward {
	if ([_webView canGoForward]) {
		[_webView goForward];			
	}
}

#pragma mark AlertViewDelegate method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
	if([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString: @"reload"]) {
		[_webView reload];
	}
	else if([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString: @"cancel"]) {
		[_webView stopLoading];
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	}
    
}

#pragma mark WebViewDelegate methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //[self.navigationController.navigationBar setTitle:@"loading..."];
    self.title = @"loading...";
    [self showLoading];
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSString *title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (title.length > 0) {
        self.title = title;
        //[self.navigationBar setTitle:title];
    }
	_goBackButton.enabled = [webView canGoBack];
    _goForwardButton.enabled = [webView canGoForward];
    [self hideLoading];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    if (error.code != -999) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"loading error."
                                                         message:@"an error occured while trying to load this page."
                                                        delegate:self
                                               cancelButtonTitle:@"cancel"
                                               otherButtonTitles:@"reload",nil];
        [alert show];	
    }
}


@end