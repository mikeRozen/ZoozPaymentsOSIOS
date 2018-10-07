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
//        _cardNumber = dict[@"card_number"];
//        _cvvNumber  = dict[@"credit_card_cvv"];
//        _holderName = dict[@"holder_name"];
//
//        NSString *expirationDate = dict[@"expiration_date"];
//        if (!isEmpty(expirationDate)){
//            NSArray *expDateArray = [expirationDate componentsSeparatedByString:@"/"];
//            _expirationMonth = expDateArray[0];
//            _expirationYear  = expDateArray[1];
//        }
//
//        NSString *tokenType = dict[@"token_type"];
//        if (!isEmpty(tokenType)){
//            _tokenType = tokenType;
//        }
    }
    return self;
}

- (NSString *)expirationDate{
    return [NSString stringWithFormat:@"%@/%@", _expirationMonth, self.expirationYear];
}


//- (NSDictionary *)toDictionary{
//    
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    NSAssert(!isEmpty(_tokenType), @"Token Type Must Not Be Empty");
//    [dict setObject:_tokenType forKey:@"token_type"];
//    NSAssert(!isEmpty(_cardNumber), @"Card Number Must Not Be Empty");
//    [dict setObject:_cardNumber forKey:@"card_number"];
//    NSAssert(!isEmpty(_cardHolderName), @"Card Holder Name Must Not Be Empty");
//    [dict setObject:_cardHolderName forKey:@"holder_name"];
//    
//    if (!isEmpty(_cvvNumber)){
//        [dict setObject:_cvvNumber forKey:@"credit_card_cvv"];
//    }
//    if (!isEmpty(_expirationMonth) && !isEmpty(_expirationYear)){
//        [dict setObject:[self expirationDate] forKey:@"expiration_date"];
//    }
//    
//    NSDictionary *addressDict = [self.address toDictionary];
//    if (!isEmpty(addressDict)){
//        [dict setObject:addressDict forKey:@"billing_address"];
//    }
//    
//    return dict;
//}





@end
