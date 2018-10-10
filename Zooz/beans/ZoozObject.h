//
//  ZoozObject.h
//  Zooz
//
//  Created by Michael Rozenblat on 29/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZoozObject : NSObject

- (NSDictionary *)toDictionary;
- (Class)propertyGenericClass:(NSString *)propertyName;
@end
