//
//  ZoozPaymentMethodDetails.h
//  Zooz
//
//  Created by Michael Rozenblat on 22/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"

@class ZoozAddress;
@class ZoozIdentityDocuments;
@interface ZoozPaymentMethodDetails : ZoozObject

@property (nonatomic) NSString *expirationMonth;
@property (nonatomic) NSString *expirationYear;
@property (nonatomic,readonly) NSString *expirationDate;
@property (nonatomic) NSString *holderName;
@property (nonatomic) NSString *cvvNumber;
@property (nonatomic) NSString *cardNumber;
@property (nonatomic) NSString *tokenType;
@property (nonatomic) ZoozAddress *billingAddress;
@property (nonatomic) ZoozIdentityDocuments *identityDocuments;
@property (nonatomic) NSDictionary *additionalDetails;

@property (nonatomic,readonly) BOOL passLuhnValidation;
@property (nonatomic,readonly) NSString *binNumber;
@property (nonatomic,readonly) NSString *vendor;
@property (nonatomic,readonly) NSString *issuerName;
@property (nonatomic,readonly) NSString *cardType;
@property (nonatomic,readonly) NSString *level;
@property (nonatomic,readonly) NSString *countryCode;
@property (nonatomic,readonly) NSString *state;
@property (nonatomic,readonly) NSString *token;
@property (nonatomic,readonly) NSString *created;
@property (nonatomic,readonly) NSString *type;
@property (nonatomic,readonly) NSString *href;
@property (nonatomic,readonly) NSString *customer;
@property (nonatomic,readonly) NSString *last4Digits;
@property (nonatomic,readonly) NSString *issuer;


@property (nonatomic,readonly) NSDictionary *rawDictionary;


- (instancetype)init;
- (instancetype)initWithDictionary:(NSDictionary *)dict;


@end
