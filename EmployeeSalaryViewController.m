//
//  EmployeeSalaryViewController.m
//  Employee Project
//
//  Created by Ashish limje on 14/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import "EmployeeSalaryViewController.h"
#import "DBManager.h"

@interface EmployeeSalaryViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation EmployeeSalaryViewController

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
    self.txtEmployeeID.delegate = self;
    self.txtSalary.delegate =self;
    
    //self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"Database.sql"];
    // Do any additional setup after loading the view.
}

- (IBAction)saveSalaryInfo:(id)sender
{
    NSString *query = [NSString stringWithFormat:@"insert into employeeSalary values(null, '%@','%@')", self.txtSalary.text, self.txtEmployeeID.text];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
