//
//  SalariesTests.m
//  SalariesTests
//
//  Created by Serhat Sarı on 10.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Employee.h"

@interface SalariesTests : XCTestCase

@end

@implementation SalariesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testFormattedSalary{
    
    Employee *employee = [[Employee alloc] initWithName:@"name" birthYear:1985];
    
    XCTAssertTrue([[employee formattedSalary:[[NSDecimalNumber alloc] initWithUnsignedInteger:3700]
                             withCurrencyCode:@"EUR"
                             withLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]] isEqualToString:@"€3,700.00"]);
    
    XCTAssertTrue([[employee formattedSalary:[[NSDecimalNumber alloc] initWithUnsignedInteger:3700]
                            withCurrencyCode:@"EUR"
                                  withLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]] isEqualToString:@"€3,700.00"]);
    
    XCTAssertTrue([[employee formattedSalary:[[NSDecimalNumber alloc] initWithUnsignedInteger:10000]
                            withCurrencyCode:@"EUR"
                                  withLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]] isEqualToString:@"€10,000.00"]);
    
    XCTAssertTrue([[employee formattedSalary:[[NSDecimalNumber alloc] initWithUnsignedInteger:123456789]
                            withCurrencyCode:@"EUR"
                                  withLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]] isEqualToString:@"€123,456,789.00"]);
    
    XCTAssertTrue([[employee formattedSalary:[[NSDecimalNumber alloc] initWithUnsignedInteger:42390]
                            withCurrencyCode:@"TRY"
                                  withLocale:[NSLocale localeWithLocaleIdentifier:@"tr_TR"]] isEqualToString:@"₺42.390,00"]);
    
    XCTAssertTrue([[employee formattedSalary:[[NSDecimalNumber alloc] initWithUnsignedInteger:42390]
                            withCurrencyCode:@"GBP"
                                  withLocale:[NSLocale localeWithLocaleIdentifier:@"en-US"]] isEqualToString:@"£42,390.00"]);
}

@end
