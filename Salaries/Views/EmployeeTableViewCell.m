//
//  EmployeeTableViewCell.m
//  Salaries
//
//  Created by Serhat Sarı on 11.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import "EmployeeTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface EmployeeTableViewCell ()

@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelBirthYear;

@end

@implementation EmployeeTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        // add a profile photo for employee
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"person"]];
        imageView.frame = CGRectMake(10, 10, 40, 40);
        imageView.layer.cornerRadius = 20;
        imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:imageView];
        
        // add a name label for employee
        CGRect frameNameLabel = CGRectMake(60, 10, CGRectGetWidth(self.contentView.frame) - 160, 40); // 160 = imageview + birthyear label + margins
        self.labelName = [[UILabel alloc] initWithFrame: frameNameLabel];
        self.labelName.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.labelName.font = [UIFont systemFontOfSize:20];
        self.labelName.textAlignment = NSTextAlignmentLeft;
        self.labelName.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:self.labelName];
        self.labelName.adjustsFontSizeToFitWidth = NO;
        
        /// add birth year label to the
        CGRect frameBirthYear = CGRectMake(CGRectGetWidth(self.contentView.frame) - 90, 10, 80, 40);
        self.labelBirthYear = [[UILabel alloc] initWithFrame:frameBirthYear];
        self.labelBirthYear.backgroundColor = [UIColor orangeColor];
        self.labelBirthYear.font = [UIFont systemFontOfSize:12];
        self.labelBirthYear.textAlignment = NSTextAlignmentCenter;
        self.labelBirthYear.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        self.labelBirthYear.layer.cornerRadius = 5;
        self.labelBirthYear.layer.masksToBounds = true;
        self.labelBirthYear.numberOfLines = 2;
        self.labelBirthYear.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.labelBirthYear];
    }
    return self;
}

- (void)reloadCellWithEmployee:(Employee *)employee {
    self.labelName.text = employee.name;
    self.labelBirthYear.text = [NSString stringWithFormat:@"%i\n%@", (int)employee.birthYear, [employee formattedSalary]];
    
    /*
     * Calling [employee formattedSalary] is the performance bottleneck in this code.
     * Creating a property called _salarString and calling the formattedSalary functin on init method on Employee class is a good way to solve this bottleneck.
     * Then call that property here;
     * self.labelBirthYear.text = [NSString stringWithFormat:@"%i\n%@", (int)employee.birthYear, employee.salaryString];
     */
}

@end
