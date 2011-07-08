//
//  MenuPrincipal.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/7/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuPrincipal;

@protocol MenuPrincipalDelegate

-(void) gotoGame:(MenuPrincipal *)requester;
-(void) gotoGC:(MenuPrincipal *)requester;
-(void) gotoShop:(MenuPrincipal *)requester;
-(void) gotoInstructions:(MenuPrincipal *)requester;

@end



@interface MenuPrincipal : UIViewController {
	
	IBOutlet UIImageView *fondo;
	IBOutlet UIImageView *startGame;
	IBOutlet UIImageView *gameCenter;
	IBOutlet UIImageView *shop;
	IBOutlet UIImageView *instructions;
	id <MenuPrincipalDelegate> delegate;

}

@property (retain) IBOutlet UIImageView *fondo;
@property (retain) IBOutlet UIImageView *startGame;
@property (retain) IBOutlet UIImageView *gameCenter;
@property (retain) IBOutlet UIImageView *shop;
@property (retain) IBOutlet UIImageView *instructions;
@property (retain) id <MenuPrincipalDelegate> delegate;


-(void) startB;
-(void) gameB;
-(void) shopB;
-(void) instructionsB;

@end
