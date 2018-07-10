//
//  EmployeeDirectory.h
//  Salaries
//
//  Created by Serhat Sarı on 10.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import <Foundation/Foundation.h>

// notification posted when the directory finishes updating
extern NSString* const kEmployeeDirectoryDidUpdateNotification;

@interface EmployeeDirectory : NSObject

@property (readonly) NSArray* employees; // returns NSArray of Employee
@property (readonly) BOOL isUpdating;

- (void)update;

@end
