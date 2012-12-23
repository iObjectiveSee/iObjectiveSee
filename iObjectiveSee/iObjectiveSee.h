//
//  iObjectiveSee.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/13/12.
//
//


//Misc
#import "CGGeometry+iOS.h"
#import "UIColor+iOS.h"
#import "NSDate+iOS.h"

//Models
#import "NSArray+iOS.h"
#import "NSString+iOS.h"
#import "NSManagedObject+iOS.h"
#import "NSMutableDictionary+iOS.h"
#import "NSDictionary+iOS.h"

//ViewControllers
#import "UIViewController+iOS.h"
#import "WebViewController.h"

//Views
#import "iOSBlockDefinitions.h"
#import "UIAlertView+iOS.h"
#import "UIActionSheet+iOS.h"
#import "UIView+iOS.h"
#import "UIWindow+iOS.h"
#import "UILabel+iOS.h"
#import "UIImage+iOS.h"


//From .pch
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define DOCUMENT_PATH(inPath) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:inPath]

#define BUNDLE_PATH(inPath) [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:inPath]

#define TEMPORARY_PATH(inPath) [NSTemporaryDirectory() stringByAppendingPathComponent:inPath]
