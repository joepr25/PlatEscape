//
//  ShopViewController.h
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 7/29/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopViewController;

@protocol ShopViewControllerDelegate

-(void) fromShopToHome:(ShopViewController *)requester;

@end

@interface ShopViewController : UIViewController {
    
    id <ShopViewControllerDelegate> delegate;
}

@property (retain) id <ShopViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIImageView *backButton;
@property (nonatomic, retain) IBOutlet UILabel *harryButton;
@property (nonatomic, retain) IBOutlet UILabel *smurfButton;
@property (nonatomic, retain) IBOutlet UILabel *noCostumeButton;


-(void) harryPressed;
-(void) smurfPressed;
-(void) noCostumePressed;

@end
