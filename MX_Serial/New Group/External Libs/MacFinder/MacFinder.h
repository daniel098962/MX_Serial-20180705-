//
//  MacFinder.h
//  MacFinder
//
//  Created by Michael Mavris on 08/06/16.
//  Copyright © 2016 Miksoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
//xcode baseSDK为11.0或者以上
#include "route.h"
#else
//xcode baseSDK为11.0以下的
#if TARGET_IPHONE_SIMULATOR
#include <net/route.h>
#else
#include "route.h"
#endif
#endif



#include "if_ether.h"
#include <arpa/inet.h>

@interface MacFinder : NSObject;
+(NSString*)ip2mac: (NSString*)strIP;
@end
