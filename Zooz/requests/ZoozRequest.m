//
//  ZoozRequest.m
//  Zooz
//
//  Created by Michael Rozenblat on 17/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozRequest.h"
//#import "ZoozPaymentMethodDetails.h"
//#import "ZoozAddress.h"
//#import "ZoozAdditionalDetails.h"
//#import "ZoozIdentityDocuments.h"
//#import "ZoozCustomer.h"

@implementation ZoozRequest

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithPaymentMethod:(ZoozPaymentMethodDetails *)paymentMethod{
    if (self = [self init]){
        self.paymentMethod = paymentMethod;
    }
    return self;
}

- (instancetype)initWithCustomer:(ZoozCustomer *)customer{
    if (self = [self init]){
        self.customer = customer;
    }
    return self;
    
}
//TODO: I am not sure about that approch
//- (NSDictionary *)toDictionary{
//    NSMutableDictionary * dict = [NSMutableDictionary new];
//
//    NSDictionary *paymentDict = [self.paymentMethod toDictionary];
//    if (!isEmpty(paymentDict)){
//        [dict setDictionary:paymentDict];
//    }
//
//    NSDictionary *customerDict = [self.customer toDictionary];
//    if (!isEmpty(customerDict)){
//        [dict addEntriesFromDictionary:customerDict];
//    }
//
//    NSDictionary *identityDict = [self.identityDocuments toDictionary];
//    if (!isEmpty(identityDict)){
//        [dict setObject:identityDict forKey:@"identity_document"];
//    }
//
//    if (!isEmpty(_additionalDetails)){
//        [dict setObject:_additionalDetails forKey:@"additional_details"];
//    }
//
//    return dict;
//}

//- (NSData *)toJsonData{
//    NSDictionary *dict = [self toDictionary];
//    if (isEmpty(dict)) return nil;
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
//    return data;
//}

@end
