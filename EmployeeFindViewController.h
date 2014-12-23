//
//  EmployeeFindViewController.h
//  Employee Project
//
//  Created by Ashish limje on 14/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmployeeFindViewControllerDelegate

-(void)editingInfoWasFinished;

@end

@interface EmployeeFindViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtFind;

- (IBAction)findButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelEmployeeInfo;

@property (nonatomic, strong) id <EmployeeFindViewControllerDelegate> delegate;
@end
