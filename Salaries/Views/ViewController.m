//
//  ViewController.m
//  Salaries
//
//  Created by Serhat Sarı on 10.07.2018.
//  Copyright © 2018 Serabisa. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeDirectory.h"
#import "Employee.h"
#import "EmployeeTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) EmployeeDirectory *employeeDirectory;

@end

@implementation ViewController

#pragma mark - Life

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // style your view
    self.view.backgroundColor = [UIColor whiteColor];
    
    // set navigation items
    self.navigationItem.title = @"Employees";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target: self action: @selector(showActions:)];
    
    // set UITableView
    self.tableView = [self createTableView];
    [self.view addSubview:self.tableView];

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // add observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(employeesUpdated:)
                                                 name:kEmployeeDirectoryDidUpdateNotification
                                               object:nil];
    
    
    // get data
    if (self.employeeDirectory == nil) {
        self.employeeDirectory = [EmployeeDirectory new];
    }
    [self.employeeDirectory update];
    
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // remove observer
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kEmployeeDirectoryDidUpdateNotification
                                                  object:nil];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [self.tableView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [self.tableView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [self.tableView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
}

/* create basic uitableview */
- (UITableView *)createTableView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.allowsSelection = NO;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    return tableView;
}

#pragma mark - Actions
     
- (void) employeesUpdated:(NSNotification *) notification {
    [self.tableView reloadData];
}

- (void) showActions:(id)sender {
    UIAlertController *alertController=   [UIAlertController
                                           alertControllerWithTitle:nil
                                           message:nil
                                           preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* defaultAction1 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                                                                   //// do nothing
                                                               }];
                                                           }];
    UIAlertAction* defaultAction2 = [UIAlertAction actionWithTitle:@"Order By Employee Name" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
                                                                   ////order employees
                                                               }];
                                                           }];
    
    [alertController addAction:defaultAction1];
    [alertController addAction:defaultAction2];
    [self presentViewController:alertController animated:NO completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.employeeDirectory.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    EmployeeTableViewCell *cell = (EmployeeTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[EmployeeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Employee *employee = (Employee *)[self.employeeDirectory.employees objectAtIndex:indexPath.row];
    [cell reloadCellWithEmployee:employee];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0F;
}

@end
