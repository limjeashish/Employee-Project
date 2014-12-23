//
//  EmployeeSalaryViewController.h
//  Employee Project
//
//  Created by Ashish limje on 14/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmployeeSalaryViewControllerDelegate

-(void)editingInfoWasFinished;

@end

@interface EmployeeSalaryViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmployeeID;

@property (weak, nonatomic) IBOutlet UITextField *txtSalary;

@property (nonatomic, strong) id <EmployeeSalaryViewControllerDelegate> delegate;

- (IBAction)saveSalaryInfo:(id)sender;

@end
