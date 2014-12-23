//
//  EditInfoViewController.m
//  Employee Project
//
//  Created by Ashish limje on 13/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import "EditInfoViewController.h"
#import "DBManager.h"

@interface EditInfoViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation EditInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtFirstname.delegate = self;
    self.txtLastname.delegate = self;
    self.txtCity.delegate = self;
    self.txtPhoneNumber.delegate = self;
   // self.txtSalary.delegate = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"Database.sql"];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveInfo:(id)sender
{
    NSString *query = [NSString stringWithFormat:@"insert into employeeInfo values(null, '%@', '%@', '%@','%@')", self.txtFirstname.text, self.txtLastname.text, self.txtCity.text,self.txtPhoneNumber.text];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0)
    {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        [self.delegate editingInfoWasFinished];
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Could not execute the query.");
    }
}
@end
