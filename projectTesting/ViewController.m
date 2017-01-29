//
//  ViewController.m
//  projectTesting
//
//  Created by Vinoth Sridharan on 1/26/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)click:(id)sender
{
    if (name.text.length>0)
    {
        NSString *str  = name.text;
        UIStoryboard *storyObj =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        secondViewController *sec=[storyObj instantiateViewControllerWithIdentifier:@"secondID"];
        sec.name=str;
        [self.navigationController pushViewController:sec animated:YES];


    }
    else
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Name Alert"
                                      message:@"Name field can't be empty"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        //
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here
                                 [self dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok];
    }
    
}

    @end
