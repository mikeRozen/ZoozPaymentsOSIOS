//
//  ZoozObject.m
//  Zooz
//
//  Created by Michael Rozenblat on 29/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozObject.h"
#import "NSObject+DictionaryConvert.h"

@implementation ZoozObject

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (NSDictionary *)toDictionary{
    return [NSObject dictionaryWithPropertiesOfObject:self];
}




@end
