//
//  SignUpViewController.m
//  coreData
//
//  Created by Kamini Sharma on 29/12/17.
//  Copyright © 2017 Kamini Sharma. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "UserDetails+CoreDataClass.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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

- (IBAction)clickSave:(id)sender {
    
    // for valid email address
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    // for valid email address
    
    // for large content
    _errorLbl.numberOfLines=0;
     [_errorLbl sizeToFit];
    
    // form fields validation
    if([_usernameTxt.text isEqualToString:@""])
    {
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Enter Username";
        
    } else if([_emailTxt.text isEqualToString:@""]){
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Enter Email";
        
    } else if([emailTest evaluateWithObject:_emailTxt.text] == NO){
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Invalid Email";
        
    } else if([_passwordTxt.text isEqualToString:@""]){
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Enter Password";
        
    } else if([_rePassTxt.text isEqualToString:@""]){
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Re-Type Password";
        
    } else if(![_rePassTxt.text isEqualToString:_passwordTxt.text]){
        _errorLbl.hidden=NO;
        _errorLbl.textColor=[UIColor redColor];
        _errorLbl.text=@"Password Doesn't match";
        
    } else {
        
        UIApplication *application=[UIApplication sharedApplication];
        AppDelegate *appdelegate=(AppDelegate *)application.delegate;
        NSManagedObjectContext *context=appdelegate.persistentContainer.viewContext;
        
        // do it with email too
        NSFetchRequest *req=[NSFetchRequest fetchRequestWithEntityName:@"UserDetails"];
        // adding condition to check username already exists
        [req setPredicate:[NSPredicate predicateWithFormat:@"username=%@",_usernameTxt.text]];
        // to set limit to 1
        [req setFetchLimit:1];
        NSUInteger count=[context countForFetchRequest:req error:nil];
        
        //NSLog(@"%u",count);
        
        /*if(count==NSNotFound) // if error exists
        {
            _errorLbl.textColor=[UIColor redColor];
            _errorLbl.text=@"error found";
            
        }*/
        
        if(count==1) // no user with name found, i.e new user
        {
            _errorLbl.hidden=NO;
            _errorLbl.textColor=[UIColor redColor];
            _errorLbl.text=@"Username already Exists";
            
        }
        if(count==0)
        { // username already exists in db
            _errorLbl.hidden=YES;
            _errorLbl.text=@"";
            
            UserDetails *user=[NSEntityDescription insertNewObjectForEntityForName:@"UserDetails" inManagedObjectContext:context];
            user.username=_usernameTxt.text;
            user.email=_emailTxt.text;
            user.password=_passwordTxt.text;
            
            [context save:nil];
            _errorLbl.textColor=[UIColor greenColor];
            _errorLbl.text=@"Registered Successfully";
            
            _usernameTxt.text=@"";
            _emailTxt.text=@"";
            _rePassTxt.text=@"";
            _passwordTxt.text=@"";
            
            //_saveBtn.hidden=YES;
            //_saveBtn.enabled=NO;
            _backToLoginBtn.hidden=NO;
            _backToLoginBtn.enabled=YES;
            
            
            NSFetchRequest *req=[NSFetchRequest fetchRequestWithEntityName:@"UserDetails"];
            NSArray *result=[context executeFetchRequest:req error:nil];
            for(UserDetails *item in result)
            {
                NSLog(@"\nname: %@ \nemail: %@ \nPassword: %@",item.username,item.email,item.password);
            }
            
        }
        
    }
        
        
    }

- (IBAction)GoToLogin:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
