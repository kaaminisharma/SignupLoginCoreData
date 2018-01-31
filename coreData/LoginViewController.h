//
//  LoginViewController.h
//  coreData
//
//  Created by Kamini Sharma on 29/12/17.
//  Copyright © 2017 Kamini Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *errorLbl;
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)signUpBtn:(id)sender;

- (IBAction)clickLogin:(id)sender;

@property(nonatomic,retain)NSString *uname;

@end
