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
#import "ZoozPaymentMethodDetails.h"
@implementation ZoozCustomer

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictioanry:(NSDictionary *)dict{
    if (self = [self init]){
        [self classWithPropertiesOfDictionary:dict];
    }
    return self;
}

- (void)addPaymentMethodToken:(ZoozPaymentMethodDetails *)payment{
    if (!_paymentMethods){
        _paymentMethods = [NSMutableArray new];
        return;
    }
    if (![_paymentMethods containsObject:payment]){
        [_paymentMethods addObject:payment];
    }
}



@end
