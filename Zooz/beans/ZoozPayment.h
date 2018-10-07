//
//  ZoozPayment.h
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"

@interface ZoozPayment : ZoozObject

@property (nonatomic,readonly) NSInteger amount;
@property (nonatomic) NSString *currency;//ISO-4217
@property (nonatomic) NSDictionary *additionalDetails;
@property (nonatomic) NSString *statementSoftDescriptor;
@property (nonatomic) NSArray *array;
@property (nonatomic) ZoozObject *object;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
