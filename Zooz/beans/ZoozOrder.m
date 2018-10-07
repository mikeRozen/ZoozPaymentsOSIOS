//
//  ZoozOrder.m
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozOrder.h"
#import "ZoozItem.h"

@implementation ZoozOrder

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]) {
        _id = dict[@"id"];
        _additionalDetails = dict[@"additional_details"];
        NSArray *array = dict[@"line_items"];
        NSMutableArray *itemsArray = [NSMutableArray new];
        for (NSDictionary *dict in array){
            ZoozItem *item = [[ZoozItem alloc] initWithDictionary:dict];
            [itemsArray addObject:item];
        }
        
        _lineItems = itemsArray;
        _taxAmount = [dict[@"tax_amount"] integerValue];
        _taxPercentage = [dict[@"tax_percentage"] doubleValue];
    }
    return self;
}

//- (NSDictionary *)toDictionary{
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    if (!isEmpty(_id)){
//        [dict setObject:_id forKey:@"id"];
//    }
//    if (!isEmpty(_additionalDetails)){
//        [dict setObject:_additionalDetails forKey:@"additional_details"];
//    }
//    
//    if (!isEmpty(_lineItems)){
//        NSMutableDictionary *dictLineItems = [[NSMutableDictionary alloc] init];
//        for (ZoozItem *item in _lineItems) {
//            //di
//        }
//    }
//    
//    [dict setObject:@(_taxAmount) forKey:@"tax_amount"];
//    [dict setObject:@(_taxPercentage) forKey:@"tax_percentage"];
//    return dict;
//}

@end
