//
//  FriendsViewController.h
//  Ribbit
//
//  Created by Alex Cruz on 9/25/15.
//  Copyright © 2015 Alex Cruz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;

@end
