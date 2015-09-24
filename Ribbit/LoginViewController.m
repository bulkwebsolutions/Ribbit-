//
//  LoginViewController.m
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;

}

- (IBAction)login:(id)sender {
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    
    if ([username length] == 0 || [password length] == 0) {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Oops"  message:@"Make sure you answer all information"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];

    
    } else {
        // Log user in
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (error) {   // Incase of error.
                                                
                                                 UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] preferredStyle:UIAlertControllerStyleAlert];
                                                [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                                    [self dismissViewControllerAnimated:YES completion:nil];
                                                }]];
                                                [self presentViewController:alertView animated:YES completion:nil];
                                                
                                            } else {
                                                // Login successful do something
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                            }
                                        }];
    }
}
    
@end
