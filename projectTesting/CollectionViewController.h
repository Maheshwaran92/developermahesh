//
//  CollectionViewController.h
//  projectTesting
//
//  Created by Vinoth Sridharan on 1/26/17.
//  Copyright © 2017 Vinoth Sridharan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController
{
    
    NSArray *images;
    NSArray *tnimages;
    NSArray *kaimages;
    NSArray *klimages;
    NSArray *apimages;
    NSArray *places;
    
    NSArray *tnplaces;
    NSArray *klplaces;
    NSArray *kaplaces;
    NSArray *applaces;

}

@property (strong, nonatomic)  NSString *state;

@end
