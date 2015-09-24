//
//  EditFriendsViewController.m
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import "EditFriendsViewController.h"
#import <Parse/Parse.h>

@interface EditFriendsViewController ()

@end

@implementation EditFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.allusers = objects;
            [self.tableView reloadData];
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allusers count];
}


// populates the cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
   forIndexPath:indexPath];
    
    PFUser *user = [self.allusers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}


@end
