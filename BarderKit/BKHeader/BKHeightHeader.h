//
//  BKHeightHeader.h
//  BarderKit
//
//  Created by Joyce on 2019/2/1.
//  Copyright © 2019 Poet. All rights reserved.
//

#ifndef BKHeightHeader_h
#define BKHeightHeader_h

#define Me_IsPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define ME_kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)
#define ME_IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !Me_IsPad : NO)

#define ME_IS_IPHONE_X_Series (ME_IS_IPHONE_X || ME_IS_IPHONE_Xr || ME_IS_IPHONE_Xs || ME_IS_IPHONE_Xs_Max)

#define ME_Height_StatusBar (ME_IS_IPHONE_X_Series ? 44.0 : 20.0)
#define ME_Height_NavBar (ME_IS_IPHONE_X_Series ? 88.0 : 64.0)
#define ME_Height_TabBar (ME_IS_IPHONE_X_Series ? 83.0 : 49.0)
#define ME_Height_BottomSafeArea (ME_IS_IPHONE_X_Series ? 34.0 : 0.0)
#define ME_Screen_Width UIScreen.mainScreen.bounds.size.width
#define ME_Screen_Height UIScreen.mainScreen.bounds.size.height
#define ME_Height_ExceptNav (ME_Screen_Height-ME_Height_NavBar)
#define ME_Height_ExceptTab (ME_Screen_Height-ME_Height_TabBar)
#define ME_Height_ExceptNavAndTab (ME_Screen_Height-ME_Height_NavBar-ME_Height_TabBar)

#endif /* BKHeightHeader_h */
