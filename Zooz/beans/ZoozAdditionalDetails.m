//
//  ZoozAdditionalDetails.m
//  Zooz
//
//  Created by Michael Rozenblat on 23/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozAdditionalDetails.h"

@implementation ZoozAdditionalDetails

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]){
        _property1 = dict[@"property1"];
        _property2 = dict[@"property2"];
    }
    return self;
}

//- (NSDictionary *)toDictionary{
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    if (!isEmpty(_property1)){
//        [dict setObject:_property1 forKey:@"property1"];
//    }
//    if (!isEmpty(_property2)){
//        [dict setObject:_property2 forKey:@"property2"];
//    }
//    
//    return dict;
//}


@end
