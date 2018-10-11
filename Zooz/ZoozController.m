//
//  ZoozController.m
//  Zooz
//
//  Created by Michael Rozenblat on 17/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozController.h"
#import "ZoozServer.h"
#import "ZoozLogger.h"
#import "Zooz-Constants.h"

#define BASE_ZOOZ_URL @"https://api.paymentsos.com/"



@interface ZoozController()
@property (nonatomic) NSURL *baseUrl;
@property (nonatomic) ZoozServer *zoozServer;


@end

@implementation ZoozController
- (instancetype)initWithAppId:(NSString *)appId publicKey:(NSString *)publicKey privateKey:(NSString *)privateKey isSandbox:(BOOL)isSandBox{
    self = [super init];
    if (self) {
        _appId = appId;
        _publicKey = publicKey;
        _privateKey = privateKey;
        _isSandbox = isSandBox;
        _baseUrl = [NSURL URLWithString:BASE_ZOOZ_URL];
        _zoozServer = [[ZoozServer alloc] initWithAppId:appId publicKey:publicKey privateKey:privateKey isSandBox:isSandBox];
    }
    return self;
}

- (void)setAllowLogging:(BOOL)allowLogging{
    [ZoozLogger shared].allowLogging = allowLogging;
    _allowLogging = allowLogging;
}

- (void)createToken:(ZoozRequest *)request completionHandler:(Completion)completion{
    NSURL *url = [NSURL URLWithString:@"tokens" relativeToURL:_baseUrl];
    ZLog(@"url = %@",url);
    
    Completion complete = ^(NSError *error,NSDictionary *response){
        ZLog(@"Create Token response  = %@",response);
        ZoozPaymentMethodDetails *payment = [[ZoozPaymentMethodDetails alloc] initWithDictionary:response];
        NSDictionary *dict = @{@"response": response,@"paymentMethod": payment};
        mainQueue(^{completion(error,dict);});
    };
    [_zoozServer createToken:request withUrl:url completionHandler:complete];
}

- (void)createCustomer:(ZoozRequest *)request completionHandler:(Completion)completion{
    NSURL *url = [NSURL URLWithString:@"customers" relativeToURL:_baseUrl];
    ZLog(@"url = %@",url);
    
    Completion complete = ^(NSError *error,NSDictionary *response){
        ZLog(@"Create Customer response  = %@",response);
        ZoozCustomer *customer = [[ZoozCustomer alloc] initWithDictioanry:response];
        NSDictionary *dict = @{@"response" : response,@"customer":customer};
        mainQueue(^{completion(error,dict);});
    };
    [_zoozServer createCustomer:request withUrl:url completionHandler:complete];
};

- (void)storeToken:(NSString *)token inCustomer:(ZoozCustomer *)customer completionHandler:(Completion)completion{
    //https://api.paymentsos.com/customers/{{customerId}}/payment-methods/{{token}}
    NSString *urlString = [NSString stringWithFormat:@"customers/%@/payment-methods/%@",customer.id,token];
    NSURL *url = [NSURL URLWithString:urlString relativeToURL:_baseUrl];
    ZLog(@"url = %@",url);
    
    Completion complete = ^(NSError *error,NSDictionary *response){
        ZLog(@"Store Token in Customer  = %@",response);
        ZoozPaymentMethodDetails *payment = [[ZoozPaymentMethodDetails alloc] initWithDictionary:response];
        NSDictionary *dict = @{@"response" : response,@"paymentMethod": payment};
        mainQueue(^{completion(error,dict);});
    };
    [_zoozServer storeToken:token inCustomer:customer withUrl:url completionHandler:complete];
}

- (void)deleteToken:(NSString *)token inCustomer:(ZoozCustomer *)customer completionHandler:(Completion)completion{
    //https://api.paymentsos.com/customers/{{customerId}}/payment-methods/{{token}}
    NSString *urlString = [NSString stringWithFormat:@"customers/%@/payment-methods/%@",customer.id,token];
    NSURL *url = [NSURL URLWithString:urlString relativeToURL:_baseUrl];
    ZLog(@"url = %@",url);
    
    Completion complete = ^(NSError *error,NSDictionary *response){
        ZLog(@"DeleteToken of Customer  = %@",response);
        NSDictionary *dict = @{@"response": response};
        mainQueue(^{completion(error,dict);});
    };
    [_zoozServer deleteToken:token inCustomer:customer withUrl:url completionHandler:complete];
}

- (void)retriveCustomerByReference:(ZoozCustomer *)customer completionHandler:(Completion)completion{
    NSString *urlString = [NSString stringWithFormat:@"customers?customer_reference=%@",customer.customerReference];
    NSURL *url = [NSURL URLWithString:urlString relativeToURL:_baseUrl];
    ZLog(@"url = %@",url);
    
    Completion complete = ^(NSError *error,NSDictionary *response){
        ZLog(@"retriveCustomer  = %@",response);
        ZoozCustomer *customer = [[ZoozCustomer alloc] initWithDictioanry:response];
        NSDictionary *dict = @{@"response": response,@"customer":customer};
        mainQueue(^{completion(error,dict);});
    };
    [_zoozServer retrieveCustomerbByReferenceWithUrl:url completionHandler:complete];
}




//- (void)storeToken:(NSString *)token byCustomerReference:(ZoozCustomer *)customer completionHandler:(Completion)completion{
//    //https://api.paymentsos.com/customers/{{customerId}}/payment-methods/{{token}}
//    NSString *urlString = [NSString stringWithFormat:@"customers?customer_reference=%@/payment-methods/%@",customer.customerReference,token];
//    NSURL *url = [NSURL URLWithString:urlString relativeToURL:_baseUrl];
//    ZLog(@"url = %@",url);
//
//    Completion complete = ^(NSError *error,NSDictionary *response){
//        ZLog(@"Store Token in Customer  = %@",response);
//        completion(error,response);
//    };
//    [_zoozServer storeToken:token inCustomer:customer withUrl:url completionHandler:complete];
//}




@end
