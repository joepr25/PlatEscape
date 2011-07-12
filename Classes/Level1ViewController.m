//
//  Level1ViewController.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "Level1ViewController.h"


@implementation Level1ViewController

@synthesize player, fondo, enemigos, score, delegate, enemyCount;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self startTimers];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void) startTimers {

	[NSTimer timerWithTimeInterval:2.0	target:self	selector:@selector(addEnemy) userInfo:nil repeats:NO];
	//Necesitamos almacenar este timer
	[NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(moveEnemy) userInfo:nil repeats:YES];
	
}

-(void) moveEnemy {

	//Recorre el arreglo de enemigos
	
		//aumenta la direccion de cada enemigo
}

-(int) quadrant {
	
/*     Regresa en que cuadrante se encuentra actualmente el usuario
 *     ____________
 *    |     |     |
 *    |  1  |   2 |
 *    |_____|_____|
 *    |     |     |
 *    |  3  |   4 |
 *    |_____|_____|
 */

	if (player.center.y < 240)
	{
		if(player.center.x < 160)
			return 1;
		else 
			return 2;
	}
	else {
		if(player.center.x < 160)
			return 3;
		else 
			return 4;
	}

	
}

-(void) addEnemy {

	
	//Checa en que cuadrante esta el usuario
	int quad = [self quadrant];
	
	//Crea al enemigo inicializandolo con una velocidad
	
	//Introduce al enemigo en el cuadrante
	
	//incrementa la cuenta de enemigos y se genera otro timer
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)releaseOutlets {

	self.player = nil;
	self.fondo = nil;
	self.enemigos = nil;
	
}

- (void)dealloc {
    [super dealloc];
}


@end
