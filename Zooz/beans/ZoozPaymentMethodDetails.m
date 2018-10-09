//
//  ZoozPaymentMethodDetails.m
//  Zooz
//
//  Created by Michael Rozenblat on 22/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozPaymentMethodDetails.h"
#import "ZoozAddress.h"
#import "NSObject+DictionaryConvert.h"

@implementation ZoozPaymentMethodDetails

- (instancetype)init{
    if(self = [super init]){
        self.tokenType = @"credit_card";
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [self init]){
        [self classWithPropertiesOfDictionary:dict];
    }
    return self;
}

- (NSString *)expirationDate{
    return [NSString stringWithFormat:@"%@/%@", _expirationMonth, self.expirationYear];
}


- (BOOL)isEqual:(id)object{
    if (self == object){
        return YES;
    }
    if (![object isKindOfClass:[self class]]){
        return NO;
    }
    
    return [self isEqualToPayment:object];
        
}

- (BOOL)isEqualToPayment:(ZoozPaymentMethodDetails *)paymet{
    if ([_token isEqualToString:paymet.token]){
        return YES;
    }
    BOOL sameExpDate = [[self expirationDate] isEqualToString:[paymet expirationDate]];
    BOOL sameLast4Digits = [[self last4Digits] isEqualToString:[paymet last4Digits]];
    
    if (sameExpDate && sameLast4Digits ){
        return YES;
    }
    
    return NO;
}




@end
