//
//  ZoozServer.h
//  Zooz
//
//  Created by Michael Rozenblat on 24/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozRequest.h"
//@class ZoozRequest;
@class ZoozCustomer;
//TODO: nullable




@interface ZoozServer : NSObject
@property (nonatomic) NSString *appId;
@property (nonatomic) NSString *publicKey;
@property (nonatomic) NSString *privateKey;
@property (nonatomic,readonly) NSString *enviromenmt;
@property (nonatomic) BOOL allowLogging;

- (instancetype)initWithAppId:(NSString *)appId publicKey:(NSString *)publicKey privateKey:(NSString *)privateKey isSandBox:(BOOL)isSandbox;

- (void)createToken:(ZoozRequest *)request withUrl:(NSURL *)url completionHandler:(Completion)completion;
- (void)createCustomer:(ZoozRequest *)requestData withUrl:(NSURL *)url completionHandler:(Completion)completion;
- (void)storeToken:(NSString *)token inCustomer:(ZoozCustomer *)customer withUrl:(NSURL *)url completionHandler:(Completion)completion;
- (void)retrieveCustomerbByReferenceWithUrl:(NSURL *)url completionHandler:(Completion)completion;
- (void)deleteToken:(NSString *)token inCustomer:(ZoozCustomer *)customer withUrl:(NSURL *)url completionHandler:(Completion)completion;

@end
