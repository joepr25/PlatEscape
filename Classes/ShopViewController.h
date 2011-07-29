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

@property (nonatomic) id <ShopViewControllerDelegate> delegate;

@end
