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
@property (nonatomic) NSString *creditCardCvv;
@property (nonatomic) NSString *cardNumber;
@property (nonatomic) NSString *tokenType;
@property (nonatomic) ZoozAddress *billingAddress;
@property (nonatomic) ZoozIdentityDocuments *identityDocuments;
@property (nonatomic) NSDictionary *additionalDetails;

@property (nonatomic) BOOL passLuhnValidation;
@property (nonatomic) NSString *binNumber;
@property (nonatomic) NSString *vendor;
@property (nonatomic) NSString *issuerName;
@property (nonatomic) NSString *cardType;
@property (nonatomic) NSString *level;
@property (nonatomic) NSString *countryCode;
@property (nonatomic) NSString *state;
@property (nonatomic) NSString *token;
@property (nonatomic) NSString *created;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *href;
@property (nonatomic) NSString *customer;
@property (nonatomic) NSString *last4Digits;
@property (nonatomic) NSString *issuer;


@property (nonatomic,readonly) NSDictionary *rawDictionary;


- (instancetype)init;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (BOOL)isEqual:(id)object;
- (BOOL)isEqualToPayment:(ZoozPaymentMethodDetails *)paymet;


@end
