//
//  ZoozIdentityDocuments.h
//  Zooz
//
//  Created by Michael Rozenblat on 23/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozObject.h"

@interface ZoozIdentityDocuments : ZoozObject

@property (nonatomic) NSString *type;
@property (nonatomic) NSString *number;

- (instancetype)init;
- (instancetype)initWithDictioanry:(NSDictionary *)dict;
//- (NSDictionary *)toDictionary;
@end
