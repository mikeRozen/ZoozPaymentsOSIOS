//
//  ZoozCostumer.h
//  Zooz
//
//  Created by Michael Rozenblat on 25/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozObject.h"
@class ZoozAddress;

@interface ZoozCustomer : ZoozObject
@property (nonatomic) NSString *customerReference;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *id;
@property (nonatomic) ZoozAddress *shippingAddress;
@property (nonatomic) NSDictionary *additionalDetails;

@property (nonatomic,readonly) NSString *created;
@property (nonatomic,readonly) NSString *modified;
@property (nonatomic,readonly) NSArray *paymentMethods;

- (instancetype)initWithDictioanry:(NSDictionary *)dict;


@end
