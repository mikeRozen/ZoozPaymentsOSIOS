//
//  ZoozCostumer.m
//  Zooz
//
//  Created by Michael Rozenblat on 25/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozCustomer.h"
#import "ZoozAddress.h"
#import "NSObject+DictionaryConvert.h"

@implementation ZoozCustomer

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictioanry:(NSDictionary *)dict{
    if (self = [self init]){
        [self classWithPropertiesOfDictionary:dict];
//        _customerReference = dict[@"customer_reference"];
//        _firstName = dict[@"first_name"];
//        _lastName  = dict[@"last_name"];
//        _email = dict[@"email"];
//        _id = dict[@"id"];
//        _shippingAddress = [[ZoozAddress alloc] initWithDictionary:dict[@"shipping_address"]];
    }
    
    return self;
}

//- (NSDictionary *)toDictionary{
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    if (!isEmpty(_customerReference)){
//        [dict setObject:_customerReference forKey:@"customer_reference"];
//    }
//    if (!isEmpty(_firstName)){
//        [dict setObject:_firstName forKey:@"first_name"];
//    }
//    if (!isEmpty(_lastName)){
//        [dict setObject:_lastName forKey:@"last_name"];
//    }
//    if (!isEmpty(_email)) {
//        [dict setObject:_email forKey:@"email"];
//    }
//    if (!isEmpty(_id)) {
//        [dict setObject:_id forKey:@"id"];
//    }
//    
//    NSDictionary *addressDict = [self.address toDictionary];
//    if (!isEmpty(addressDict)){
//        [dict setObject:addressDict forKey:@"shipping_address"];
//    }
//    
//    return dict;
//}

@end
