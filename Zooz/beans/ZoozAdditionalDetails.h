//
//  ZoozAdditionalDetails.h
//  Zooz
//
//  Created by Michael Rozenblat on 23/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"

@interface ZoozAdditionalDetails : ZoozObject
@property (nonatomic) NSString *property1;
@property (nonatomic) NSString *property2;

- (instancetype)init;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
//- (NSDictionary *)toDictionary;

@end
