//
//  ZoozItem.m
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozItem.h"

@implementation ZoozItem

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]){
        _name = dict[@"name"];
        _id = dict[@"id"];
        _quantity = [dict[@"quantity"] integerValue];
        _unitPrice = [dict[@"unit_price"] integerValue];
    }
    return self;
}


//- (NSDictionary *)toDictionary{
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    if (!isEmpty(_name)){
//        [dict setObject:_name forKey:@"name"];
//    }
//    if (!isEmpty(_id)){
//        [dict setObject:_id forKey:@"id"];
//    }
//    [dict setObject:@(_quantity) forKey:@"quantity"];
//    [dict setObject:@(_unitPrice) forKey:@"unit_price"];
//    return dict;
//}



@end
