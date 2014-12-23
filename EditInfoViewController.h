//
//  EditInfoViewController.h
//  Employee Project
//
//  Created by Ashish limje on 13/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditInfoViewControllerDelegate

-(void)editingInfoWasFinished;

@end

@interface EditInfoViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;

@property (weak, nonatomic) IBOutlet UITextField *txtLastname;

@property (weak, nonatomic) IBOutlet UITextField *txtCity;

@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNumber;

@property (nonatomic, strong) id<EditInfoViewControllerDelegate> delegate;

- (IBAction)saveInfo:(id)sender;


@end
