//
//  CollectionViewController.m
//  projectTesting
//
//  Created by Vinoth Sridharan on 1/26/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "secondViewController.h"

@interface CollectionViewController ()

@property(nonatomic,strong)NSArray *selectionArray;
@property(nonatomic,strong)NSArray *selectionImageArray;


@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    _selectionArray=[[NSArray alloc]init];
    _selectionImageArray=[[NSArray alloc]init];
    //
    images=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"alapuzha"], [UIImage imageNamed:@"charminar"],[UIImage imageNamed:@"chikmangalur"],[UIImage imageNamed:@"coorg"],[UIImage imageNamed:@"gandikota"],[UIImage imageNamed:@"Hampi"],[UIImage imageNamed:@"kanyakumari"],[UIImage imageNamed:@"kollam"],[UIImage imageNamed:@"mahabalipuram"],[UIImage imageNamed:@"mangalore"],[UIImage imageNamed:@"munar"],[UIImage imageNamed:@"mysore"],[UIImage imageNamed:@"ooty"],[UIImage imageNamed:@"thanjavur"],[UIImage imageNamed:@"tirupathi"],[UIImage imageNamed:@"wayanad"],nil];
    tnimages=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"kanyakumari"],[UIImage imageNamed:@"mahabalipuram"],[UIImage imageNamed:@"ooty"],[UIImage imageNamed:@"thanjavur"],nil];

    kaimages=[[NSArray alloc]initWithObjects: [UIImage imageNamed:@"coorg"],[UIImage imageNamed:@"Hampi"], [UIImage imageNamed:@"mangalore"],[UIImage imageNamed:@"mysore"],nil];
    klimages=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"alapuzha"],[UIImage imageNamed:@"kollam"],[UIImage imageNamed:@"munar"],[UIImage imageNamed:@"wayanad"],nil];

    apimages=[[NSArray alloc]initWithObjects: [UIImage imageNamed:@"charminar"], [UIImage imageNamed:@"gandikota"],[UIImage imageNamed:@"kollam"],[UIImage imageNamed:@"mahabalipuram"],[UIImage imageNamed:@"tirupathi"],nil];

    places=[[NSArray alloc]initWithObjects:@"Alapuzha",@"Charminar",@"Chikmangalur" ,@"Coorg",@"Gandikota", @"Hampi",@"Kanyakumari", @"Kollam", @"Mahabalipuram",@"Mangalore",@"Munar",@"Mysore",@"Ooty", @"Thanjavur",@"Tirupathi",@"Wayanad",nil];
    tnplaces=[[NSArray alloc]initWithObjects: @"Kanyakumari", @"Mahabalipuram",@"Ooty", @"Thanjavur",nil];
    klplaces=[[NSArray alloc]initWithObjects:@"Alapuzha", @"Kollam", @"Munar", @"Wayanad",nil];
    

    applaces=[[NSArray alloc]initWithObjects:@"Charminar",@"Gandikota",  @"Tirupathi",@"Hampi",nil];
    

    kaplaces=[[NSArray alloc]initWithObjects:@"Chikmangalur" ,@"Coorg", @"Mangalore",@"Mysore",nil];
    

    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self checkCondition];
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)checkCondition
{
    if ([_state isEqualToString:@"Tamilnadu"])
    {
        _selectionArray=tnplaces;
        _selectionImageArray=tnimages;
    }
    else if ( [_state isEqualToString:@"Kerala"])
    {
        _selectionArray=klplaces;
        _selectionImageArray=klplaces;
    }
    else if ([_state isEqualToString:@"Andhrapradesh"])
    {
        _selectionArray=applaces;
        _selectionImageArray=applaces;
    }
    else if ( [_state isEqualToString:@"Karnataka"])
    {
        _selectionArray=kaplaces;
        _selectionImageArray=kaplaces;
    }
    else{
        // Configure the cell
        _selectionArray=places;
        _selectionImageArray=images
        ;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _selectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.lbl.text=[_selectionArray objectAtIndex:indexPath.row];
    cell.imgView.image=[_selectionImageArray objectAtIndex:indexPath.row];
  return cell;
    
}
//

-(void)setState:(NSString *)astate
{
    _state=astate;
   
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

    

    @end
