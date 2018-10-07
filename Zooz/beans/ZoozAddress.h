//
//  ZoozAddress.h
//  Zooz
//
//  Created by Michael Rozenblat on 23/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"


@interface ZoozAddress : ZoozObject

@property (nonatomic) NSString *countryCode;//ISO 3166-1 alpha-3
@property (nonatomic) NSString *state;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *line1;
@property (nonatomic) NSString *line2;
@property (nonatomic) NSString *zipCode;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *phone;
@property (nonatomic) NSString *email;

- (instancetype)init;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
//- (NSDictionary *)toDictionary;

@end
