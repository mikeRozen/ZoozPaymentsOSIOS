//
//  NSString+CamelSnakeCase.m
//  Zooz
//
//  Created by Michael Rozenblat on 11/10/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "NSString+CamelSnakeCase.h"

@implementation NSString (CamelSnakeCase)

+ (NSString *)camelCase:(NSString *)key{
    NSArray *components = [key componentsSeparatedByString:@"_"];
    NSMutableString *camelCaseString = [NSMutableString new];
    [components enumerateObjectsUsingBlock:^(NSString *component, NSUInteger idx, BOOL *stop) {
        [camelCaseString appendString:(idx == 0 ? component : [component capitalizedString])];
    }];
    return [camelCaseString copy];
}

+ (NSString *)snakeCase:(NSString *)propertyName{
    NSMutableString *result = [NSMutableString stringWithString:propertyName];
    NSRange range;
    
    
    NSMutableCharacterSet *mutableSet = [NSMutableCharacterSet uppercaseLetterCharacterSet];
    [mutableSet formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    range = [result rangeOfCharacterFromSet:mutableSet];
    while (range.location != NSNotFound){
        NSString *lower = [result substringWithRange:range].lowercaseString;
        [result replaceCharactersInRange:range withString:[NSString stringWithFormat:@"_%@", lower]];
        range = [result rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    }
    return result;
}


@end
