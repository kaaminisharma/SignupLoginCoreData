//
//  DashboardViewController.m
//  coreData
//
//  Created by Kamini Sharma on 29/12/17.
//  Copyright © 2017 Kamini Sharma. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userNameLbl.text=[NSString stringWithFormat:@"welcome, %@",_userName];
    // for large content
    _userNameLbl.numberOfLines=0;
    [_userNameLbl sizeToFit];
    
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

@end
