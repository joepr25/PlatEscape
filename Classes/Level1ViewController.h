//
//  Level1ViewController.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Level1ViewController;

@protocol Level1ViewControllerDelegate

-(void) returnToLevelSelect:(Level1ViewController *)requester;

@end



@interface Level1ViewController : UIViewController {
	
	IBOutlet UIImageView *player;
	IBOutlet UIImageView *fondo;
	NSMutableArray *enemigos;
	int enemyCount;
	int score;
	id <Level1ViewControllerDelegate> delegate;

}

@property (retain) IBOutlet UIImageView *player;
@property (retain) IBOutlet UIImageView *fondo;
@property (retain) NSMutableArray *enemigos;
@property (retain) id <Level1ViewControllerDelegate> delegate;
@property int score;
@property int enemyCount;

-(void) startTimers;
-(void) addEnemy;
-(void) moveEnemy;
-(int) quadrant;

@end
