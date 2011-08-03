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
    int actual;//se almacena cual fué el último que se eligió
    int selected;//índice de traje seleccionado
    NSArray *costumes;
    NSArray *icons;
}

@property (retain) id <ShopViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIImageView *backButton;
@property (nonatomic, retain) IBOutlet UIImageView *nextButton;
@property (nonatomic, retain) IBOutlet UIImageView *previousButton;
@property (nonatomic, retain) IBOutlet UIImageView *on;
@property (nonatomic, retain) IBOutlet UILabel *text;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UIImageView *costume;


-(void) nextButtonPressed;
-(void) previousButtonPressed;
-(void) selectCostume;


@end
