//
//  Level1ViewController.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallEnemy.h"
#import "Items.h"

@class Level1ViewController;

@protocol Level1ViewControllerDelegate

-(void) returnToLevelSelect:(Level1ViewController *)requester;
-(void) returnToMainM:(Level1ViewController *)requester;
-(NSDictionary *) getGameInfo;

@end



@interface Level1ViewController : UIViewController <UIAlertViewDelegate, UIAccelerometerDelegate>{
	
	IBOutlet UIImageView *player;
	IBOutlet UIImageView *fondo;
	IBOutlet UILabel *scoreEnPantalla;
	NSMutableArray *enemigos;
	int enemyCount;
    int itemCount;
	double score;
	id <Level1ViewControllerDelegate> delegate;
    NSTimer *mueveEnemigos;
    NSTimer *tactualizaScore;
    NSTimer *tchecaColisiones;
    NSTimer *agregaEnemigos;
    NSTimer *agregaItems;
    NSTimer *quitaItem;
    UIAlertView *alert;
    UIAccelerometer *accelerometer;
    Items *item;
    BOOL itemIsOut;
    BOOL isInPause;
    BOOL tilt;
    double time1;
    double time2;
    double time3;

    
}

@property (retain) IBOutlet UIImageView *player;
@property (retain) IBOutlet UIImageView *fondo;
@property (retain) UILabel *scoreEnPantalla;
@property (retain) NSMutableArray *enemigos;
@property (retain) Items *item;
@property BOOL itemIsOut;
@property BOOL isInPause;
@property int itemCount;
@property (retain) NSTimer *mueveEnemigos;
@property (retain) NSTimer *tactualizaScore;
@property (retain) NSTimer *tchecaColisiones;
@property (retain) NSTimer *agregaEnemigos;
@property (retain) NSTimer *agregaItems;
@property (retain) NSTimer *quitaItem;
@property (retain) UIAlertView *alert;
@property (retain) UIAlertView *pauseMode;
@property (retain) id <Level1ViewControllerDelegate> delegate;
@property double score;
@property int enemyCount;
@property (nonatomic, retain) UIAccelerometer *accelerometer;

-(void) startTimers;
-(void) addEnemy;
-(void) moveEnemy;
-(int) quadrant;
-(void) movePlayer:(UIPanGestureRecognizer *)gesture;
-(void) actualizaScore;
-(void) checaColisiones;
-(BOOL) punto:(CGPoint)punto perteneceAlView:(UIImageView *)imagen;
-(void) addKeyItem;
-(void) removeKeyItem;
-(void) showPause:(UITapGestureRecognizer *)tgr;
-(void) releaseOutlets;

@end
