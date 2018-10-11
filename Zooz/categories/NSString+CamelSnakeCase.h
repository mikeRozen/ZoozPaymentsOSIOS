//
//  NSString+CamelSnakeCase.h
//  Zooz
//
//  Created by Michael Rozenblat on 11/10/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CamelSnakeCase)

+ (NSString *)camelCase:(NSString *)key;
+ (NSString *)snakeCase:(NSString *)propertyName;

@end
