//
//  InboxViewController.m
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import "InboxViewController.h"

@interface InboxViewController ()

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"Current user is: %@", currentUser.username);
    } else {
        // show the signup or login screen
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
}

@end
