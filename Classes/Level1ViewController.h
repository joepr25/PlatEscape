//
//  Level1ViewController.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallEnemy.h"

@class Level1ViewController;

@protocol Level1ViewControllerDelegate

-(void) returnToLevelSelect:(Level1ViewController *)requester;

@end



@interface Level1ViewController : UIViewController {
	
	IBOutlet UIImageView *player;
	IBOutlet UIImageView *fondo;
	IBOutlet UILabel *scoreEnPantalla;
	NSMutableArray *enemigos;
	int enemyCount;
	double score;
	id <Level1ViewControllerDelegate> delegate;
    NSTimer *mueveEnemigos;
    NSTimer *tactualizaScore;
    NSTimer *tchecaColisiones;

    
}

@property (retain) IBOutlet UIImageView *player;
@property (retain) IBOutlet UIImageView *fondo;
@property (retain) UILabel *scoreEnPantalla;
@property (retain) NSMutableArray *enemigos;
@property (retain) NSTimer *mueveEnemigos;
@property (retain) NSTimer *tactualizaScore;
@property (retain) NSTimer *tchecaColisiones;
@property (retain) id <Level1ViewControllerDelegate> delegate;
@property double score;
@property int enemyCount;

-(void) startTimers;
-(void) addEnemy;
-(void) moveEnemy;
-(int) quadrant;
-(void) movePlayer:(UIPanGestureRecognizer *)gesture;
-(void) actualizaScore;
-(void) checaColisiones;
-(BOOL)punto:(CGPoint)punto perteneceAlView:(UIImageView *)imagen;
-(void) seDetectoColision;

@end
