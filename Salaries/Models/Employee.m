//
//  Employee.m
//  Salaries
//
//  Created by Serhat Sarı on 10.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import "Employee.h"

static NSUInteger const kStartingSalary = 3700;
NSString* const kSalaryCurrency = @"EUR";

@implementation Employee

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear
{
    self = [super init];
    if(self)
    {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
        _salaryString = [self formattedSalary];
    }
    return self;
}

- (NSString *)formattedSalary{
    return [self formattedSalary:self.salary withCurrencyCode:kSalaryCurrency withLocale:[NSLocale currentLocale]];
}

- (NSString *)formattedSalary:(NSDecimalNumber *) salary withCurrencyCode:(NSString *)currencyCode withLocale:(NSLocale *)locale{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];// set the format of number
    [formatter setCurrencyCode:currencyCode];// set the currency code
    [formatter setLocale:locale];// set the locale of both currency code asnd sallary
    NSString *localizedMoneyString = [formatter stringFromNumber:salary];
    
    return localizedMoneyString;
}

- (NSComparisonResult)compare:(Employee *)employee { 
    return [self.name compare:employee.name];
}

@end
