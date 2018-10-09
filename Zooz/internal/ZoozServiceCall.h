//
//  ZoozServiceCall.h
//  Zooz
//
//  Created by Michael Rozenblat on 30/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozPaymentMethodDetails.h"
#import "ZoozAdditionalDetails.h"
#import "ZoozIdentityDocuments.h"
#import "ZoozCustomer.h"
#import "ZoozAddress.h"

typedef void(^Completion)(NSError *error,NSDictionary *response);

@interface ZoozServiceCall : NSObject

@property (nonatomic) ZoozPaymentMethodDetails *paymentMethod;
//@property (nonatomic) ZoozIdentityDocuments *identityDocuments;
@property (nonatomic) ZoozCustomer *customer;
//@property (nonatomic) NSDictionary *additionalDetails;


- (NSDictionary *)toDictionary;
- (NSData *)toJsonData;

@end
