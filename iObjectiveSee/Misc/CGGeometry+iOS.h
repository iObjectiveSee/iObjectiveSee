//
//  CGGeometry+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


CG_INLINE bool
__CGSizeGreaterThanSize(CGSize size1, CGSize size2) {
    return size1.width > size2.width || size1.height > size2.height;
}
#define CGSizeGreaterThanSize __CGSizeGreaterThanSize


