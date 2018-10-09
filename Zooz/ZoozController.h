//
//  ZoozController.h
//  Zooz
//
//  Created by Michael Rozenblat on 17/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoozRequest.h"

@interface ZoozController : NSObject



@property (nonatomic) NSString *appId;
@property (nonatomic) NSString *publicKey;
@property (nonatomic) NSString *privateKey;
@property (nonatomic) BOOL isSandbox;
@property (nonatomic) BOOL allowLogging;

//TODO:Documentation
- (instancetype)initWithAppId:(NSString * )appId publicKey:(NSString *)publicKey privateKey:(NSString *) privateKey isSandbox:(BOOL)isSandBox;

- (void)createToken:(ZoozRequest *)request completionHandler:(Completion)completion;
- (void)storeToken:(NSString *)token inCustomer:(ZoozCustomer *)customer completionHandler:(Completion)completion;
- (void)deleteToken:(NSString *)token inCustomer:(ZoozCustomer *)customer completionHandler:(Completion)completion;
- (void)createCustomer:(ZoozRequest *)request completionHandler:(Completion)completion;
- (void)retriveCustomerByReference:(ZoozCustomer *)customer completionHandler:(Completion)completion;
    
@end
