//
//  LoginViewController.m
//  coreData
//
//  Created by Kamini Sharma on 29/12/17.
//  Copyright © 2017 Kamini Sharma. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "UserDetails+CoreDataClass.h"
#import "DashboardViewController.h"
#import "SignUpViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUpBtn:(id)sender {
 
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SignUpViewController *signUp=[story instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:signUp animated:YES];
    
}

- (IBAction)clickLogin:(id)sender {
    
    
    // form field validation
    if([_usernameTxt.text isEqualToString:@""])
    {
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Enter Username";
        
    } else if([_passwordTxt.text isEqualToString:@""]){
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Enter Password";
        
    } else {
    
        _errorLbl.hidden=YES;
        _errorLbl.text=@"";
    UIApplication *application=[UIApplication sharedApplication];
    AppDelegate *appdelegate=(AppDelegate *)application.delegate;
    NSManagedObjectContext *context=appdelegate.persistentContainer.viewContext;
    
    NSFetchRequest *req=[NSFetchRequest fetchRequestWithEntityName:@"UserDetails"];
    // adding condition to check if username exists
    [req setPredicate:[NSPredicate predicateWithFormat:@"username=%@ and password=%@",_usernameTxt.text,_passwordTxt.text]];
    // to set limit to 1
    [req setFetchLimit:1];
    NSUInteger count=[context countForFetchRequest:req error:nil];
    if(count==1) // user exists with password
    {
        NSArray *result=[context executeFetchRequest:req error:nil];
        for(UserDetails *userInfo in result)
        {
            _uname=userInfo.username;
            NSLog(@"name: %@",userInfo.username);
        }
        
        // [self performSegueWithIdentifier:@"logintodash" sender:self];
        UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        DashboardViewController *dash=[story instantiateViewControllerWithIdentifier:@"DashboardViewController"];
        dash.userName=_uname;
        [self.navigationController pushViewController:dash animated:YES];
        
    } else { // wrong credentials
        
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Invalid username and password";
        
    }
        
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    _errorLbl.text=@"";
    _usernameTxt.text=@"";
    _passwordTxt.text=@"";
}
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"logintodash"])
    {
        DashboardViewController *dash=segue.destinationViewController;
        dash.userName=_uname;
        //[self.navigationController pushViewController:dash animated:YES];
        
    }
}
*/
@end
