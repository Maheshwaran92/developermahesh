//
//  secondViewController.m
//  projectTesting
//
//  Created by Vinoth Sridharan on 1/26/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

#import "secondViewController.h"
#import "CollectionViewController.h"

@interface secondViewController ()
@property(nonatomic,strong)NSArray *selectionArray;

@end

@implementation secondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selectionArray=[[NSArray alloc]init];
    [self.country setUserInteractionEnabled:NO];
    [self.state setUserInteractionEnabled:NO];
    countries= [[NSArray alloc]initWithObjects:@"India",@"Canada", @"USA",@"Germany", nil];
    _selectionArray=countries;
    //
    states1=[[NSArray alloc]initWithObjects:@"Tamilnadu",@"Kerala",@"Andhrapradesh",@"Telegana",@"Karnataka", nil];
    states2=[[NSArray alloc]initWithObjects:@"Alberta",@"Quebec",@"Ontario",@"Yukon",@"Manitoba", nil];
    states3=[[NSArray alloc]initWithObjects:@"Atlanta",@"Washington D.C",@"Boston",@"LA",@"Michigan", nil];
    states4=[[NSArray alloc]initWithObjects:@"Berlin",@"Bremen",@"Hamburg",@"Hesse",@"Saxony", nil];
    //
     self.nameLbl.text=[NSString stringWithFormat:@"Hello %@!",self.name];
    
}

    // Do any additional setup after loading the view.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)down:(id)sender
{
    [self .tabList setHidden:NO];
    //
    self.selectionArray=countries;
    [self.tabList reloadData];
}
- (IBAction)up:(id)sender
{
    if (_country.text.length>0)
    {
        [self.tabList setHidden:NO];
        //
        if ([_country.text isEqualToString:@"India"])
        {
            _selectionArray=states1;
        }
        else if ([_country.text isEqualToString:@"Canada"])
            
        {
            _selectionArray=states2;
            
        }
        else if ([_country.text isEqualToString:@"USA"])
            
        {
            _selectionArray=states3;
            
        }
        else if([_country.text isEqualToString:@"Germany"])
        {
            _selectionArray=states4;
            
        }
        else//
        {
            //Pop alert
        }
        
        [_tabList reloadData];

    }
    else
    {
       
        
        [self displayAlertWithTitle:@"State Alert" andMessage:@"Select a country first"];
        
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return _selectionArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    UITableViewCell *cell =[[UITableViewCell alloc] init];
    
    cell.textLabel.text=[_selectionArray objectAtIndex:indexPath.row];
    
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 1;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *str=[_selectionArray objectAtIndex:indexPath.row];
    NSLog(@"str %@",str);
    if ([_selectionArray isEqualToArray:countries])
    {
        _country.text=str;
    }
    else
    {
        _state.text=str;
    }
    
    
    [tableView setHidden:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)ok:(id)sender
{
    if (_country.text.length>0 && _state.text.length>0)
    {
        UIStoryboard *storyObj=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CollectionViewController *fourObj=[storyObj instantiateViewControllerWithIdentifier:@"collectID"];
        fourObj.state=_state.text;
        [self.navigationController pushViewController:fourObj animated:YES];
    }
    else
    {
        [self displayAlertWithTitle:@"Selection Alert" andMessage:@"Country & State must be chosen!"];
    }
  

}
-(void)displayAlertWithTitle:(NSString *)title andMessage:(NSString*)message
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
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
-(void)setName:(NSString *)aname
{
    _name=aname;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
