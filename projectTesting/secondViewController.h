//
//  secondViewController.h
//  projectTesting
//
//  Created by Vinoth Sridharan on 1/26/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSArray *countries;
    NSArray *states1;
    NSArray *states2;
    NSArray *states3;
    NSArray *states4;
    

}
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITableView *tabList;
@property (strong, nonatomic)  NSString *name;


@end
