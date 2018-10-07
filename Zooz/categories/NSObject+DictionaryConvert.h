//
//  NSObject+DictionaryConvert.h
//  Zooz
//
//  Created by Michael Rozenblat on 25/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictionaryConvert)
+ (NSDictionary *)dictionaryWithPropertiesOfObject:(id)obj;
+ (NSString *)camelCase:(NSString *)key;
- (void)classWithPropertiesOfDictionary:(NSDictionary *)dict;

@end
