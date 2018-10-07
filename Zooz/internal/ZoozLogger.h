//
//  ZoozLogger.h
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>



#ifdef DEBUG

#define ZLog( s, ... ) [[ZoozLogger shared] print: [self class] func: [NSString stringWithFormat: @"%s", __PRETTY_FUNCTION__] line: __LINE__ str: [NSString stringWithFormat:(s), ##__VA_ARGS__]]
#else
#define ZLog( s, ... )
#endif


@interface ZoozLogger : NSObject
@property (nonatomic) BOOL allowLogging;

+ (ZoozLogger *)shared;
- (void)print:(Class)theClass func:(NSString*)func line:(int)line str:(NSString*)str;

@end
