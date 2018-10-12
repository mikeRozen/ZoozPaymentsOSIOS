# ZoozPaymentsOsIOS

![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Version](https://img.shields.io/badge/pod-1.3-blue.svg)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/mikeRozen/ZoozPaymentsOSIOS/blob/master/LICENSE)


## Getting Started
ZoozPaymentsOSIOS is a simple connector to  [Zooz](https://www.zooz.com) API, written in Obj-C. Check out the offcial Zooz API [documentation](https://developers.paymentsos.com/docs/api/) to see all possible options.

## Installation

Currently available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZoozPaymentsOSIOS'
```

## Requirements
IOS 9.0 or higher

## Example

Initilaization of the main controller 
```  
    _zoozController = [[ZoozController alloc] initWithAppId:@"appId" publicKey:@"publicKey" privateKey:@"privateKey" isSandbox:YES];
    _zoozController.allowLogging = YES;
```
Tokenization of a credit crad
```
     ZoozPaymentMethodDetails *paymentDetails = [[ZoozPaymentMethodDetails alloc] init];
    paymentDetails.cardNumber = @"4580458045804580";
    paymentDetails.cvvNumber = @"123";
    paymentDetails.expirationMonth = @"12";
    paymentDetails.expirationYear = @"29";
    paymentDetails.holderName = @"Harry Potter";
    
    //Request
    ZoozRequest *request = [[ZoozRequest alloc] initWithPaymentMethod:paymentDetails];

    [_zoozController createToken:request completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        ZoozPaymentMethodDetails *zoozPaymentMethod = respondObject[@"paymentMethod"];
    }];
```
Registering your client in zooz
```  
    ZoozCustomer *customer = [[ZoozCustomer alloc] init];
    customer.customerReference = @"XXX";
    customer.firstName = @"Yuval";
    ZoozAddress *address = [[ZoozAddress alloc] init];
    address.countryCode = @"USA";
    address.state = @"TX";
    address.city = @"Greenville";
    address.zipCode = @"75402-3435";
    customer.shippingAddress = address;
    
    //Request
    ZoozRequest *request = [[ZoozRequest alloc] initWithCustomer:customer];
     
    [_zoozController createCustomer:request completionHandler:^(NSError *error, id respondObject) {
       NSLog(@"respondObject = %@",respondObject);
       ZoozCustomer *customer = respondObject[@"customer"]; 
    }];
```
Storing the credit card for later charge under specific customer

```
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.id = @"a46395f4-fdbc-4da8-b160-2a38518ac515";//Customer id which u received after customer registration
    NSString *token = @"1ccf7199-ff54-4879-bda9-d29cef9e3755";// Credit card token  
    [_zoozController storeToken:token inCustomer:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        ZoozPaymentMethodDetails *zoozPaymentMethod = respondObject[@"paymentMethod"];
    }];
```

Retrive customer by refernce number which was specified during the registration
```
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.customerReference = @"E7C96973-6904-44BD-A9C4-2EFB53FDE113";
    [_zoozController retriveCustomerByReference:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
        ZoozCustomer *customer = respondObject[@"customer"];
    }];
```
Delete the credit card under 
```
    ZoozCustomer *customer = [[ZoozCustomer alloc]init];
    customer.id = @"a46395f4-fdbc-4da8-b160-2a38518ac515"; //This Field required
    
    //Credit Card Token
    NSString *token = @"ba9cf3c9-49ca-4b11-bb05-7a593dc3f759";
    
    [_zoozController deleteToken:token inCustomer:customer completionHandler:^(NSError *error, id respondObject) {
        NSLog(@"respondObject = %@",respondObject);
    }];
```

## Author

Michael Rozenblat

## License

ZoozPaymentsOsIOS is available under the MIT license. See the [LICENSE](https://github.com/mikeRozen/ZoozPaymentsOSIOS/blob/master/LICENSE) file for more info.

