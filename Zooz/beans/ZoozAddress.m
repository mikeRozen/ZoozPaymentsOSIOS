//
//  ZoozAddress.m
//  Zooz
//
//  Created by Michael Rozenblat on 23/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozAddress.h"
#import "ZoozObject.h"

@implementation ZoozAddress

- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if ( self = [self init]){
        _countryCode = dict[@"country"];
        _state = dict[@"state"];
        _city = dict[@"city"];
        _line1 = dict[@"line1"];
        _line2 = dict[@"line2"];
        _zipCode = dict[@"zip_code"];
        _title = dict[@"title"];
        _firstName = dict[@"first_name"];
        _lastName = dict[@"last_name"];
        _phone = dict[@"phone"];
        _email = dict[@"email"];
    }
    return self;
}

//- (NSDictionary *)toDictionary{
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    if (!isEmpty(_countryCode)){
//        [dict setObject:_countryCode forKey:@"country"];
//    }
//    if (!isEmpty(@"state")){
//        [dict setObject:_state forKey:@"state"];
//    }
//    if (!isEmpty(_city)){
//        [dict setObject:_city forKey:@"city"];
//    }
//    if (!isEmpty(_line1)){
//        [dict setObject:_line1 forKey:@"line1"];
//    }
//    if (!isEmpty(_line2)){
//        [dict setObject:_line2 forKey:@"line2"];
//    }
//    if (!isEmpty(_zipCode)){
//        [dict setObject:_zipCode forKey:@"zip_code"];
//    }
//    if (!isEmpty(_title)){
//        [dict setObject:_title forKey:@"title"];
//    }
//    if (!isEmpty(_firstName)){
//        [dict setObject:_firstName forKey:@"first_name"];
//    }
//    if (!isEmpty(_lastName)){
//        [dict setObject:_lastName forKey:@"last_object"];
//    }
//    if (!isEmpty(_phone)){
//        [dict setObject:_phone forKey:@"phone"];
//    }
//    if (!isEmpty(_email)){
//        [dict setObject:_email forKey:@"email"];
//    }
//    return dict;
//}

@end
