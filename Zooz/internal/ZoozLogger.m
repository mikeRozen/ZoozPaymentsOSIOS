//
//  ZoozLogger.m
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozLogger.h"

@implementation ZoozLogger

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

+ (ZoozLogger *)shared{
    static ZoozLogger *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[ZoozLogger alloc] init];
    });
    return sharedInstance;
}

- (void)print:(Class)theClass func:(NSString*)func line:(int)line str:(NSString*)str{
    
    if ( _allowLogging ){
        NSLog(@"ZoozLogger %@: %@    %@ (Line %i)", NSStringFromClass(theClass), str, func, line);
    }
    
}



@end
