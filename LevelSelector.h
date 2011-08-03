//
//  LevelSelector.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/7/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LevelSelector;

@protocol LevelSelectorDelegate

-(void) goToLevel1:(LevelSelector *)requester;
-(void) goToLevel2:(LevelSelector *)requester;
-(void) goToHome:(LevelSelector *)requester;

@end



@interface LevelSelector : UIViewController {
	
	IBOutlet UIImageView *fondo;
	IBOutlet UIImageView *level1;
	IBOutlet UIImageView *level2;
	IBOutlet UIImageView *back;
	id <LevelSelectorDelegate> delegate;

}

@property (retain) IBOutlet UIImageView *level1;
@property (retain) IBOutlet UIImageView *level2;
@property (retain) IBOutlet UIImageView *fondo;
@property (retain) IBOutlet UIImageView *back;
@property (retain) id <LevelSelectorDelegate> delegate;

-(void) level1Pressed;
-(void) level2Pressed;
-(void) home;

@end
