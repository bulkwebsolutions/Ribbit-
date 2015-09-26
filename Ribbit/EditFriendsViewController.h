//
//  EditFriendsViewController.h
//  Ribbit
//
//  Created by Alex Cruz on 9/24/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsViewController : UITableViewController
@property(nonatomic, strong) NSArray *allusers;
@property(nonatomic, strong) NSMutableArray *friends;
@property(nonatomic, strong) PFUser *currentUser;
-(BOOL)isFriend:(PFUser *)user;
@end
