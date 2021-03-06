//
//  CGGeometry+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kiOSDefaultToolBarHeight 44.0f
#define kiOSDefaultNavigationBarHeight 44.0f
#define kiOSDefaultTabBarHeight 49.0f

#define kiOSPortraitiPhoneKeyBoardHeight 216
#define kiOSPortraitiPadKeyBoardHeight 264
#define kiOSLandscapeiPhoneKeyBoardHeight 162
#define kiOSLandscapeiPadKeyBoardHeight 352

CG_INLINE bool
__CGSizeGreaterThanSize(CGSize size1, CGSize size2) {
    return size1.width > size2.width || size1.height > size2.height;
}
#define CGSizeGreaterThanSize __CGSizeGreaterThanSize


CG_INLINE CGFloat
__DegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}
#define DegreesToRadians

CG_INLINE CGFloat
__RadiansToDegrees(CGFloat radians) {
    return radians * 180/M_PI;
}
#define RadiansToDegrees
