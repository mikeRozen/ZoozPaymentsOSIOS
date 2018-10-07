//
//  ZoozPayment.m
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozPayment.h"

@implementation ZoozPayment

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]){
        _amount = [dict[@"amount"] integerValue];
        _currency = dict[@"currency"];
        _additionalDetails = dict[@"additional_details"];
        _statementSoftDescriptor = dict[@"statement_soft_descriptor"];
    }
    return self;
}

@end
