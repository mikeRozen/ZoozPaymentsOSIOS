//
//  ZoozItem.h
//  Zooz
//
//  Created by Michael Rozenblat on 26/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"

@interface ZoozItem : ZoozObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *id;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) NSInteger unitPrice;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

//- (NSDictionary *)toDictionary;

@end
