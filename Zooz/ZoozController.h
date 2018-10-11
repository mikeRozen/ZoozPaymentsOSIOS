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

/**
 Setting the enviroment test/live default is NO
 */
@property (nonatomic) BOOL isSandbox;

/**
 Allow output library logging to console
 */
@property (nonatomic) BOOL allowLogging;

/**
 Initiates Controller object with basic configurations
 
 @param appId The id of your app
 @param publicKey The public key of your app
 @param privateKey The private key of your app
 @param isSandBox App enviroment you wish to connect test/live - true/false
 
 @return ZoozController objects
 */
- (instancetype)initWithAppId:(NSString * )appId publicKey:(NSString *)publicKey privateKey:(NSString *) privateKey isSandbox:(BOOL)isSandBox;

/**
 Tokenize the Credit card
 
 @param request ZoozRequest object which must include paymentMethod
 @param completion A block object to be executed when method is finished succefully/unsucefully. The block has two paramaters error,dictionary
    the dictionary will include two key/values.
    response - which is a raw response from Zooz and paymentMethod of type ZoozPaymentMethodDetails
 @warning The completion block should not be nil
 */
- (void)createToken:(ZoozRequest *)request completionHandler:(Completion)completion;

/**
 Register Customer in Zooz
 
 @param request ZoozRequest object which must include customer
 @param completion A block object to be executed when method is finished succefully/unsucefully. The block has two paramaters error,dictionary
    the dictionary will include two key/values.
    response - which is a raw response from Zooz and customer  of type ZoozCustomer
 @warning The completion block should not be nil
 */
- (void)createCustomer:(ZoozRequest *)request completionHandler:(Completion)completion;

/**
 Assign token to specic customer, this method should be called in case of later charge, e.g if you want to charge that customer later on or
 repeat the charge over time without asking the customer to add credit card once again
 
 @param token The token of the Credit card
 @param customer ZoozCustomer object @warning customer must have id
 @param completion A block object to be executed when method is finished succefully/unsucefully. The block has two paramaters error,dictionary
 the dictionary will include two key/values.
 response - which is a raw response from Zooz and customer  of type ZoozCustomer
 @warning The completion block should not be nil
 */
- (void)storeToken:(NSString *)token inCustomer:(ZoozCustomer *)customer completionHandler:(Completion)completion;

/**
 Delete Credit card of specific user
 
 @param token The token of the Credit card
 @param customer ZoozCustomer object @warning customer must have id
 @param completion A block object to be executed when method is finished succefully/unsucefully. The block has two paramaters error,dictionary
 the dictionary will include two key/values.
 response - which is a raw response from Zooz (in that case it will be nil)
 @warning The completion block should not be nil
 */

- (void)deleteToken:(NSString *)token inCustomer:(ZoozCustomer *)customer completionHandler:(Completion)completion;

/**
 Retrive customer by reference number that you specifiied on creation/registration
 
 @param customer ZoozCustomer object @warning customer must have customerReference
 @param completion A block object to be executed when method is finished succefully/unsucefully. The block has two paramaters error,dictionary
 the dictionary will include two key/values.
 response - which is a raw response from Zooz and customer of type ZoozCustomer
 @warning The completion block should not be nil
 */
- (void)retriveCustomerByReference:(ZoozCustomer *)customer completionHandler:(Completion)completion;
    
@end
