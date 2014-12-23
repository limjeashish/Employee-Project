//
//  EmployeeDetailsViewController.h
//  Employee Project
//
//  Created by Ashish limje on 13/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeCellTableViewCell.h"
#import "EditInfoViewController.h"
#import "EmployeeFindViewController.h"
#import "EmployeeSalaryViewController.h"


@interface EmployeeDetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, EditInfoViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tblEmployee;

- (IBAction)addNewRecord:(id)sender;

- (IBAction)findRecord:(id)sender;

- (IBAction)addSalary:(id)sender;

@end
