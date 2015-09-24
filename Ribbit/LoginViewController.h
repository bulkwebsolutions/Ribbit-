//
//  LoginViewController.h
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end
