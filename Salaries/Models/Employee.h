//
//  Employee.h
//  Salaries
//
//  Created by Serhat Sarı on 10.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;

/**
 * returns the Salary in a currency formatted with currency symbol like €3,700.00
 */
- (NSString *) formattedSalary;

/**
 * returns the Salary in a currency formatted with currency symbol like €3,700.00
 * salary: Salary of employee
 * currencyCode: Global Currency Codes in String Format. (ex: EUR, TRY, AED)
 * locale: NSLocal which want to see the salary.
 */
- (NSString *) formattedSalary:(NSDecimalNumber *) salary withCurrencyCode:(NSString *)currencyCode withLocale:(NSLocale *)locale;

@end
