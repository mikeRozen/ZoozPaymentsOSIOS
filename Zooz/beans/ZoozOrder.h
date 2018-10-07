//
//  ZoozOrder.h
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"

@class ZoozItem;


@interface ZoozOrder : ZoozObject

@property (nonatomic) NSString *id;
@property (nonatomic) NSDictionary *additionalDetails;
@property (nonatomic) NSMutableArray <ZoozItem *>  *lineItems;
@property (nonatomic) NSInteger taxAmount;
@property (nonatomic) double taxPercentage;


@end
