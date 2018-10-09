//
//  ZoozRequest.h
//  Zooz
//
//  Created by Michael Rozenblat on 17/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozServiceCall.h"

@interface ZoozRequest : ZoozServiceCall

- (instancetype)initWithPaymentMethod:(ZoozPaymentMethodDetails *)paymentMethod;
- (instancetype)initWithCustomer:(ZoozCustomer *)customer;


@end
