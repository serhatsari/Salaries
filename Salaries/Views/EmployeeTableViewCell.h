//
//  EmployeeTableViewCell.h
//  Salaries
//
//  Created by Serhat Sarı on 11.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface EmployeeTableViewCell : UITableViewCell

- (void) reloadCellWithEmployee:(Employee *)employee;

@end
