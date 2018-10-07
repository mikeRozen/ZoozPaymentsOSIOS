//
//  ZoozIdentityDocuments.m
//  Zooz
//
//  Created by Michael Rozenblat on 23/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozIdentityDocuments.h"

@implementation ZoozIdentityDocuments

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictioanry:(NSDictionary *)dict{
    if (self = [self init]){
        _type = dict[@"type"];
        _number = dict[@"number"];
    }
    return self;
}

//- (NSDictionary *)toDictionary{
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    if (!isEmpty(_type)){
//        [dict setObject:_type forKey:@"type"];
//    }
//    if (!isEmpty(_number)){
//        [dict setObject:_number forKey:@"number"];
//    }
//    return dict;
//}


@end
