//
//  NSObject+DictionaryConvert.m
//  Zooz
//
//  Created by Michael Rozenblat on 25/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "NSObject+DictionaryConvert.h"
#import <objc/runtime.h>
#import "ZoozLogger.h"
#import "NSString+CamelSnakeCase.h"


@implementation NSObject (DictionaryConvert)
+ (NSDictionary *)dictionaryWithPropertiesOfObject:(id)obj{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id object = [obj valueForKey:key];
        key = [NSString snakeCase:key];
        
        if (!object){continue;}
        if ([object isKindOfClass:[NSNumber class]] ||[object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSDictionary class]]){
            if(object) [dict setObject:object forKey:key];
        }else if([object isKindOfClass:[NSArray class]]){
            NSMutableArray *subObj = [NSMutableArray array];
            for (id o in object) {
                [subObj addObject:[self dictionaryWithPropertiesOfObject:o]];
            }
            [dict setObject:subObj forKey:key];
        }else if ([object isKindOfClass:[NSObject class]]){//Assuming our classes are subclassed with NSObjetc
            if(object) [dict setObject:[self dictionaryWithPropertiesOfObject:object] forKey:key];
        }
    }
    
    free(properties);
    return [NSDictionary dictionaryWithDictionary:dict];
}

- (void)classWithPropertiesOfDictionary:(NSDictionary *)dict{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(properties[i])];
        const char *type = property_getAttributes(properties[i]);
        NSString *attributesStr = [NSString stringWithUTF8String:type];
        NSArray *attributes = [self propertyAttributes:attributesStr];
        if ([attributes containsObject:@"R"]){
            continue;
        }
        Class typeClass = [self typeFromAttributes:attributesStr attributes:attributes];
        
        NSString *key = [NSString snakeCase:propertyName];
        id object = dict[key];
      
        //We have object and its assosicated class from our zoozClass
        if (!object){
            continue;
        }
        ZLog(@"typeClass = %@, object type = %@, propertyName = %@,attributes = %@",typeClass,[object class],propertyName,attributesStr);
        if (!typeClass){
            [self setValue:object forKey:propertyName];
            continue;
        }
       
        if (typeClass == [NSNumber class] || typeClass == [NSString class] || typeClass == [NSDictionary class]){
            [self setValue:object forKey:propertyName];
            continue;
        }else if(typeClass == [NSArray class] || typeClass == [NSMutableArray class]){
            NSMutableArray *subObj = [NSMutableArray array];
            //TODO: Ugly solution !!!! - Supress warning
            Class genericClass;
            //SEL selector = NSSelectorFromString(@"propertyGenericClass:");
            #pragma GCC diagnostic ignored "-Wundeclared-selector"
            if ([self respondsToSelector:@selector(propertyGenericClass:)]){
                genericClass = [self performSelector:@selector(propertyGenericClass:) withObject:propertyName];
            }
            if (genericClass){
                for (id o in object) {
                    id genericElement = [genericClass new];
                    [genericElement classWithPropertiesOfDictionary:o];
                    [subObj addObject:genericElement];
                }
            }
            [self setValue:subObj forKey:propertyName];
        }else{
            ZLog(@"No Foundation Calss Is Found");
            id customeClass = [[typeClass alloc] init];
            [customeClass classWithPropertiesOfDictionary:object];
            [self setValue:customeClass forKey:propertyName];
        }
    }
    
    free(properties);
}

- (NSArray *)propertyAttributes:(NSString *)typeAttributesString{
    if (!typeAttributesString) {return nil;}
    NSArray *attributes = [typeAttributesString componentsSeparatedByString:@","];
    return attributes;
}

- (Class)typeFromAttributes:(NSString *)typeAttributesString attributes:(NSArray *)attributes{
    if (!typeAttributesString) {return nil;}
    if ([typeAttributesString hasPrefix:@"T@"] && [typeAttributesString length] > 1) {
       // NSArray *attributes = [typeAttributesString componentsSeparatedByString:@","];
        NSString *typeAttribute = [attributes firstObject];
        NSString *typeClassName = [typeAttribute substringWithRange:NSMakeRange(3, [typeAttribute length] - 4)];
        Class typeClass = NSClassFromString(typeClassName);
        return typeClass;
    }else{
        return nil;//Probably not a class type
    }
}


+ (void)printAllProperties:(id)obj{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        ZLog(@"key = %@",key);
    }
    free(properties);
}



@end
