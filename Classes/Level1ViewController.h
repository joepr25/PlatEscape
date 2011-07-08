//
//  Level1ViewController.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Level1ViewController : UIViewController {
	
	IBOutlet UIImageView *player;
	IBOutlet UIImageView *fondo;
	NSMutableArray *enemigos;
	int score;

}

@property (retain) IBOutlet UIImageView *player;
@property (retain) IBOutlet UIImageView *fondo;
@property (retain) NSMutableArray *enemigos;
@property int score;

@end
