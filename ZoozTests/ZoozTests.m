//
//  ZoozTests.m
//  ZoozTests
//
//  Created by Michael Rozenblat on 17/09/2018.
//  Copyright © 2018 Michael Rozenblat. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZoozController.h"
#import "NSObject+DictionaryConvert.h"
#import "ZoozPayment.h"

@interface ZoozTests : XCTestCase
@property (nonatomic) ZoozController *zoozController;
@end

@implementation ZoozTests

- (void)setUp {
    
    [super setUp];
    _zoozController = [[ZoozController alloc] initWithAppId:@"appId" publicKey:@"publicKey" privateKey:@"privateKey" isSandbox:YES];
    
    _zoozController.allowLogging = YES;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddCard {
   
    //Payment Method
    ZoozPaymentMethodDetails *paymentDetails = [[ZoozPaymentMethodDetails alloc] init];
    paymentDetails.cardNumber = @"4580458045804580";
    paymentDetails.cvvNumber = @"123";
    paymentDetails.expirationMonth = @"12";
    paymentDetails.expirationYear = @"29";
    paymentDetails.holderName = @"John Mark";
    
    //Request
    ZoozRequest *request = [[ZoozRequest alloc] initWithPaymentMethod:paymentDetails];

    XCTestExpectation *expectation = [self expectationWithDescription:@"Finishing Token Creation"];
    
    [_zoozController createToken:request completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        XCTAssertTrue(YES);
        [expectation fulfill];
    }];
    
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error){
            XCTFail(@"Probably Timmed Out Error = %@",error.description);
        }
    }];
}

- (void)testAddCustomer{
    
    //Customer
    ZoozCustomer *customer = [[ZoozCustomer alloc] init];
    customer.customerReference = @"XXX";
    customer.firstName = @"Yuval";
    //Shipping Address
    ZoozAddress *address = [[ZoozAddress alloc] init];
    address.countryCode = @"USA";
    address.state = @"TX";
    address.city = @"Greenville";
    address.zipCode = @"75402-3435";
    customer.shippingAddress = address;
    
    //Request
    ZoozRequest *request = [[ZoozRequest alloc] initWithCustomer:customer];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Finishing Customer"];
    
    [_zoozController createCustomer:request completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        XCTAssertTrue(YES);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error){
            XCTFail(@"Probably Timmed Out Error = %@",error.description);
        }
    }];
    
//    response  = {
//        created = 1537958608348;
//        "customer_reference" = FAFADAD;
//        "first_name" = John;
//        id = "a46395f4-fdbc-4da8-b160-2a38518ac515";
//        "last_name" = Taylor;
//        modified = 1537958608348;
//        "shipping_address" =     {
//            city = Greenville;
//            country = USA;
//            state = TX;
//            "zip_code" = "75402-3435";
//        };
    
}


- (void)testStoreToken{
   
    //Customer
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.id = @"a46395f4-fdbc-4da8-b160-2a38518ac515";
    NSString *token = @"730ff333-402b-4446-8086-e0a2e7571aa0";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Finishing Customer"];
    
    [_zoozController storeToken:token inCustomer:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        XCTAssertTrue(YES);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error){
            XCTFail(@"Probably Timmed Out Error = %@",error.description);
        }
        
    }];
}

- (void)testStoreTokenByCustomereReference{
    
    //Customer
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.id = @"a46395f4-fdbc-4da8-b160-2a38518ac515";
    customer.customerReference = @"FAFADAD";
    NSString *token = @"d5afeae9-f8f3-4e82-89e3-f0a22ce1a3ae";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Finishing Customer"];
    
    [_zoozController storeToken:token byCustomerReference:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        XCTAssertTrue(YES);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error){
            XCTFail(@"Probably Timmed Out Error = %@",error.description);
        }
    }];
}

- (void)testDeletePaymentMethod{
   
    //Customer
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.customerReference = @"FAFADAD";
    customer.id = @"a46395f4-fdbc-4da8-b160-2a38518ac515";
    
    //Credit Card Token
    NSString *token = @"ba9cf3c9-49ca-4b11-bb05-7a593dc3f759";
    
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Finishing Customer"];
    
    [_zoozController deleteToken:token inCustomer:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        XCTAssertTrue(YES);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error){
            XCTFail(@"Probably Timmed Out Error = %@",error.description);
        }
    }];
}

- (void)testRetriveCustomerByReference{
    
    //Customer
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.customerReference = @"FAFADAD";
    customer.id = @"a46395f4-fdbc-4da8-b160-2a38518ac515";
    
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Finishing Customer"];
    
    [_zoozController retriveCustomerByReference:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        XCTAssertTrue(YES);
        [expectation fulfill];
        
    }];
    
    [self waitForExpectationsWithTimeout:10.0 handler:^(NSError * _Nullable error) {
        if (error){
            XCTFail(@"Probably Timmed Out Error = %@",error.description);
        }
    }];    
}

- (void)testSimple {
    ZoozPaymentMethodDetails *paymentDetails = [[ZoozPaymentMethodDetails alloc] init];
    paymentDetails.cardNumber = @"4580458045804580";
    paymentDetails.cvvNumber = @"123";
    paymentDetails.expirationMonth = @"12";
    
    //paymentDetails.expirationMonth = @"12";
    paymentDetails.expirationYear = @"29";
    paymentDetails.holderName = @"John Mark";
    
    ZoozAddress *address = [[ZoozAddress alloc] init];
    address.state = @"my state";
    address.city = @"my city";
    paymentDetails.billingAddress = address;
    NSDictionary *dict = [NSObject dictionaryWithPropertiesOfObject:paymentDetails];
    NSLog(@"dict = %@",dict);
    
    XCTAssert(YES,@"Succed");
}

- (void)testMethods{
    ZoozPayment *payment = [ZoozPayment new];
    NSDictionary *dict = @{@"amount": @(9),@"currency": @"USD",@"array": @[@(1),@(2)],@"object": [ZoozObject new],@"additional_details":@{@"stam": @"stam"}};

    [payment classWithPropertiesOfDictionary:dict];
    NSLog(@"Zoozpayment = %@",payment);
    
    XCTAssert(YES,@"Succed");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
