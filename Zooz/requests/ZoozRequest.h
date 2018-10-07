//
//  ZoozRequest.h
//  Zooz
//
//  Created by Michael Rozenblat on 17/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozServiceCall.h"
//#import "ZoozPaymentMethodDetails.h"
//#import "ZoozAdditionalDetails.h"
//#import "ZoozIdentityDocuments.h"
//#import "ZoozCustomer.h"
//#import "ZoozAddress.h"


@interface ZoozRequest : ZoozServiceCall

//@property (nonatomic) ZoozPaymentMethodDetails *paymentMethod;
//@property (nonatomic) ZoozIdentityDocuments *identityDocuments;
//@property (nonatomic) ZoozCustomer *customer;
//@property (nonatomic) NSDictionary *additionalDetails;


- (instancetype)initWithPaymentMethod:(ZoozPaymentMethodDetails *)paymentMethod;
- (instancetype)initWithCustomer:(ZoozCustomer *)customer;


//- (NSDictionary *)toDictionary;
//- (NSData *)toJsonData;


@end
