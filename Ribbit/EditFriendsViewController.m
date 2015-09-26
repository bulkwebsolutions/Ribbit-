//
//  EditFriendsViewController.m
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import "EditFriendsViewController.h"

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
    
    self.currentUser = [PFUser currentUser];
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
    
    if ([self isFriend:user]) {
        // add check mark
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        // clear check mark
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


// Did select delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
        PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
        PFUser *user = [self.allusers objectAtIndex:indexPath.row];
        [friendsRelation addObject:user];
        [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            
           if (error) {
               NSLog(@"Error %@ %@", error, [error userInfo]);
           }
            
    }];

}

#pragma mark - Helpers
-(BOOL)isFriend:(PFUser *)user{
    for (PFUser *friend in self.friends) {
        if ([friend.objectId isEqualToString:user.objectId]) {
            return YES;
        }
    }
    
    return NO;
    
}


@end











