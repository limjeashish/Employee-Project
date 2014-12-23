//
//  EmployeeDetailsViewController.m
//  Employee Project
//
//  Created by Ashish limje on 13/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import "EmployeeDetailsViewController.h"
#import "DBManager.h"
#import "EmployeeCellTableViewCell.h"


@interface EmployeeDetailsViewController ()

@property (nonatomic,strong) DBManager *dbManager;
@property (nonatomic,strong) NSArray *arrEmployeeInfo;
@property (nonatomic,strong) NSArray *arrEmployeeSalary;

-(void)loadData;

@end

@implementation EmployeeDetailsViewController

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
    self.tblEmployee.delegate = self;
    self.tblEmployee.dataSource = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"Database.sql"];
    
    [self loadData];
    
}
-(void)loadData
{
    // Form the query.
    NSString *query = @"select * from employeeInfo";
   // NSString *query1 = @"select * from employeeSalary";
    
    // Get the results.
    if (self.arrEmployeeInfo != nil) //&& self.arrEmployeeSalary != nil
    {
        self.arrEmployeeInfo = nil;
        //self.arrEmployeeSalary = nil;
    }
    self.arrEmployeeInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
   // self.arrEmployeeSalary = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query1]];
    
    // Reload the table view.
    [self.tblEmployee reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0)
        return self.arrEmployeeInfo.count;
//    else
//        return self.arrEmployeeSalary.count;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if(section == 0)
//        return @"EMPLOYEE DETAILS";
//    else
//        return @"EMPLOYEE SALARY";
//    
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"employeeCell";
    EmployeeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger indexOfID = [self.dbManager.arrColumnNames indexOfObject:@"employeeID"];
    NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"firstname"];
    NSInteger indexOfLastname = [self.dbManager.arrColumnNames indexOfObject:@"lastname"];
    NSInteger indexOfCity = [self.dbManager.arrColumnNames indexOfObject:@"city"];
    NSInteger indexOfPhone = [self.dbManager.arrColumnNames indexOfObject:@"phoneNo"];
  
//    NSInteger indexOfSalaryID = [self.dbManager.arrColumnNames1 indexOfObject:@"employeeSalaryID"];
//    NSInteger indexOfSalary = [self.dbManager.arrColumnNames1 indexOfObject:@"salary"];
//    NSInteger indexOfEmployee_ID = [self.dbManager.arrColumnNames1 indexOfObject:@"employee_ID"];
    
    // Set the loaded data to the appropriate cell labels.
//    if (cell == nil)
//    {
//        cell = [[EmployeeCellTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
//
//   if (indexPath.section==0)
//   {
       cell.labelID.text = [NSString stringWithFormat:@"%@",[[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfID]];
       cell.labelName.text = [NSString stringWithFormat:@"%@ %@", [[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname], [[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfLastname]];
       cell.labelCity.text = [NSString stringWithFormat:@"%@", [[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfCity]];
       cell.labelPhone.text = [NSString stringWithFormat:@"%@", [[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfPhone]];
        
       return cell;
//    }
//    else
//    {
//       cell.labelID.text = [NSString stringWithFormat:@"%@",[[self.arrEmployeeSalary objectAtIndex:indexPath.row] objectAtIndex:indexOfSalaryID]];
//        cell.labelName.text = [NSString stringWithFormat:@"%@",[[self.arrEmployeeSalary objectAtIndex:indexPath.row] objectAtIndex:indexOfSalary]];
//        cell.labelCity.text = [NSString stringWithFormat:@"%@",[[self.arrEmployeeSalary objectAtIndex:indexPath.row] objectAtIndex:indexOfEmployee_ID]];
        
//        return cell;
//    }
    
}

//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        // Delete the selected record.
//        // Find the record ID.
//        int recordIDToDelete = [[[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:0] intValue];
//        
//        // Prepare the query.
//        NSString *query = [NSString stringWithFormat:@"delete from employeeInfo where employeeID=%d", recordIDToDelete];
//        
//        // Execute the query.
//        [self.dbManager executeQuery:query];
//        
//        // Reload the table view.
//        [self loadData];
//    }
//}

-(void)editingInfoWasFinished
{
    // Reload the data.
    [self loadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditInfoViewController *editInfoViewController = [segue destinationViewController];
    editInfoViewController.delegate = self;
}


- (IBAction)addNewRecord:(id)sender
{
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}

- (IBAction)findRecord:(id)sender
{
    [self performSegueWithIdentifier:@"idSegueFind" sender:self];
}

- (IBAction)addSalary:(id)sender
{
    [self performSegueWithIdentifier:@"idSegueSalary" sender:self];
}

 // NSInteger indexOfSalary = [self.dbManager.arrColumnNames indexOfObject:@"salary"];

//    else
//    {
//       // cell.labelName.text = [NSString stringWithFormat:@"%@ %@", [[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname], [[self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfLastname]];
//
//       // cell.labelCity.text = [NSString stringWithFormat:@"%@", [[ self.arrEmployeeInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfSalary]];
//        return cell;
//    }


//    // Set the loaded data to the appropriate cell labels.
//    if (cell == nil)
//    {
//        cell = [[EmployeeCellTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }



@end
