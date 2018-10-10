//
//  ZoozObject.m
//  Zooz
//
//  Created by Michael Rozenblat on 29/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozObject.h"
#import "NSObject+DictionaryConvert.h"

@implementation ZoozObject

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (NSDictionary *)toDictionary{
    return [NSObject dictionaryWithPropertiesOfObject:self];
}

//Its NOT the best work around - Unfortunaltelly I don't think tere is
//a proper way to get the generic type of NSArray
- (Class)propertyGenericClass:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"paymentMethods"]){
        return NSClassFromString(@"ZoozPaymentMethodDetails");
    }
    return nil;
}





@end
