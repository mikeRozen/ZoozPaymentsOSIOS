//
//  ZoozServer.m
//  Zooz
//
//  Created by Michael Rozenblat on 24/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import "ZoozServer.h"
#import "ZoozRequest.h"
#import "ZoozLogger.h"
#import "Zooz-Constants.h"



@interface ZoozServer()
@property (nonatomic) NSURLSession *session;

@end

@implementation ZoozServer
//TODO: maybe we should make it Singeltone or part of it
//TODO: maybe enums on on httpMethods
//TODO: maybe we should add delegate to have more closer look on the network
- (instancetype)init{
    if (self = [super init]){
        [self sessionSetup];
        _enviromenmt = @"test";
    }
    return self;
}

- (instancetype)initWithAppId:(NSString *)appId publicKey:(NSString *)publicKey privateKey:(NSString *)privateKey isSandBox:(BOOL)isSandbox{
    if (self = [self init]){
        _appId = appId;
        _publicKey = publicKey;
        _privateKey = privateKey;
        _enviromenmt = isSandbox ? @"test" : @"live";
    }
    return self;
}
- (void)sessionSetup{
    if (isEmpty(_session)){
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        configuration.allowsCellularAccess = YES;
        configuration.timeoutIntervalForRequest = 20.0;
        configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
}

- (NSMutableURLRequest *)requestMethod:(NSString *)httpMethod url:(NSURL *)url requestBody:(NSData *)httpBody{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = httpMethod;
    request.HTTPBody = httpBody;
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"1.2.0" forHTTPHeaderField:@"api-version"];
    [request setValue:_appId forHTTPHeaderField:@"app_id"];
    [request setValue:_publicKey forHTTPHeaderField:@"public_key"];
    [request setValue:_privateKey forHTTPHeaderField:@"private_key"];
    [request setValue:_enviromenmt forHTTPHeaderField:@"x-payments-os-env"];
    return request;
}

- (void)createToken:(ZoozRequest *)requestData withUrl:(NSURL *)url completionHandler:(Completion)completion{
    NSMutableURLRequest *request = [self requestMethod:@"POST" url:url requestBody:[requestData toJsonData]];
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil){
            NSDictionary *dict = [self parsingData:data];
            NSError *error = [self internalError:response];
            completion(error,dict);
        }else{
            ZLog(@"createToken Failed Error: %@", error.localizedDescription);
            completion(error,nil);
        }
    }];
    [task resume];
}

- (void)createCustomer:(ZoozRequest *)requestData withUrl:(NSURL *)url completionHandler:(Completion)completion{
    NSMutableURLRequest *request = [self requestMethod:@"POST" url:url requestBody:[requestData toJsonData]];
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil){
            NSDictionary *dict = [self parsingData:data];
            NSError *error = [self internalError:response];
            completion(error,dict);
        }else{
            ZLog(@"createCustomer Failed Error: %@", error.localizedDescription);
            completion(error,nil);
        }
    }];
    [task resume];
}

- (void)storeToken:(NSString *)token inCustomer:(ZoozCustomer *)customer withUrl:(NSURL *)url completionHandler:(Completion)completion{
    NSMutableURLRequest *request = [self requestMethod:@"POST" url:url requestBody:nil];
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil){
            NSDictionary *dict = [self parsingData:data];
            NSError *error = [self internalError:response];
            completion(error,dict);
        }else{
            ZLog(@"Stored token Failed Error: %@", error.localizedDescription);
            completion(error,nil);
        }
    }];
    [task resume];
}

- (void)deleteToken:(NSString *)token inCustomer:(ZoozCustomer *)customer withUrl:(NSURL *)url completionHandler:(Completion)completion{
    NSMutableURLRequest *request = [self requestMethod:@"DELETE" url:url requestBody:nil];
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil){
            NSDictionary *dict = [self parsingData:data];
            NSError *error = [self internalError:response];
            completion(error,dict);
        }else{
            ZLog(@"Stored token Failed Error: %@", error.localizedDescription);
            completion(error,nil);
        }
    }];
    [task resume];
}

- (void)retrieveCustomerbByReferenceWithUrl:(NSURL *)url completionHandler:(Completion)completion{
    NSMutableURLRequest *request = [self requestMethod:@"GET" url:url requestBody:nil];
    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil){
            NSDictionary *dict = [self parsingData:data];
            NSError *error = [self internalError:response];
            completion(error,dict);
        }else{
            ZLog(@"RetrieveCustomerbByReferenceWithUrl Failed Error: %@", error.localizedDescription);
            completion(error,nil);
        }
    }];
    [task resume];
}
    

//TODO: Error Handling
- (NSDictionary *)parsingData:(NSData *)data{
    NSError *parsingError = nil;
    NSDictionary *dict = nil;
    if (isEmpty(data)){return dict;}
    
    dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parsingError];
    //Not sure why zooz decided to send their responses in array???
    if ([dict isKindOfClass:[NSArray class]]){
        dict = [(NSArray *)dict firstObject];
    }
    
    if (!isEmpty(parsingError)){
        ZLog(@"parsing error = %@",parsingError.description);
        NSAssert(NO, @"Parsing Failed");
    }
    return dict;
}

- (NSError *)internalError:(NSURLResponse *)originResponse{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)originResponse;
    if ((response.statusCode >= 300 || response.statusCode < 200)) {
        //We may need to split the errors in different error domain
        NSError *error = [[NSError alloc] initWithDomain:@"Internal Error" code:1 userInfo:@{NSLocalizedDescriptionKey: @"Invalid user input"}];
        return error;
    }
    return nil;
}






@end
