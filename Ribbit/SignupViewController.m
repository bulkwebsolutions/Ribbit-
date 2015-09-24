//
//  SignupViewController.m
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// We should check for valid email
// Lets only check to make sure the user didn't leave any trailing white space.
- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Oops"  message:@"Make sure you answer all information"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        user.email = email;
 
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {   // Hooray! Let them use the app now.
                
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] preferredStyle:UIAlertControllerStyleAlert];
                [alertView addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
                }]];
                [self presentViewController:alertView animated:YES completion:nil];
                
            } else {   // NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
    }
                                        
            
}

@end
