//
//  Level1ViewController.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "Level1ViewController.h"


@implementation Level1ViewController

@synthesize player, fondo, enemigos, score, delegate, enemyCount, scoreEnPantalla, mueveEnemigos, tactualizaScore, tchecaColisiones;

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
	
	
    /*
     * Aquí vamos a habilitar el reconocimiento de movimiento del jugador
     */
    
    player.userInteractionEnabled = YES;
	UIGestureRecognizer *pgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePlayer:)];
	[self.view addGestureRecognizer:pgr];
	[pgr release];
    
    
    //Inicializamos arreglos y variables
	enemigos = [[NSMutableArray alloc] initWithCapacity:50];
    score = 0.00;
    
    /*
     * Lanzamos los timers
     */
    
	[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(addEnemy) userInfo:nil repeats:NO];
	mueveEnemigos = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveEnemy) userInfo:nil repeats:YES];
    tactualizaScore = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(actualizaScore) userInfo:nil repeats:YES];
    tchecaColisiones = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checaColisiones) userInfo:nil repeats:YES]; 
	
}

-(void) moveEnemy {
    
	CGPoint direccion;
    
	for(SmallEnemy *key in enemigos)
	{
		direccion = key.direccion;
		key.center = CGPointMake(key.center.x+direccion.x,key.center.y+direccion.y);
		
			if(key.center.x > 320 || key.center.x < 0)
			{
				direccion.x = -direccion.x;
				//[sonido play];
			}
			if(key.center.y > 460 || key.center.y < 0)
			{
				direccion.y = -direccion.y;
				//[sonido play];
			}
			key.direccion = direccion;

	}
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
	CGRect frame;
	switch (quad) {
		case 1:
			frame = CGRectMake(288, 420, 20, 20);
			break;
		case 2:
			frame = CGRectMake(20, 420, 20, 20);
			break;
		case 3:
			frame = CGRectMake(280, 20, 20, 20);
			break;
		case 4:
			frame = CGRectMake(20, 13, 20, 20);
            break;

	}
	
	SmallEnemy *enemy = [[SmallEnemy alloc] initWithImage:[UIImage imageNamed:@"Enemigo_1A.png"] inQuadrant:quad];
	enemy.frame = frame;
    
	//Introduce al enemigo en el cuadrante
	[enemigos addObject:enemy];
	[self.view insertSubview:enemy belowSubview:scoreEnPantalla];
	[enemy release];
	
	//incrementa la cuenta de enemigos y se genera otro timer
	enemyCount++;
    if(enemyCount > 20)
        printf("Se llego al limite de enemigos\n");
    else
	[NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(addEnemy) userInfo:nil repeats:NO];

	
}

-(void) movePlayer:(UIPanGestureRecognizer *)gesture {

		CGPoint translation;
		CGPoint newLocation;
		translation = [gesture translationInView:self.view];
		newLocation.x = player.center.x + translation.x;
		newLocation.y = player.center.y + translation.y;
		
		
		

			if(newLocation.x < 0.0)
				newLocation.x = 0.0;
			if(newLocation.x > 320.0)
				newLocation.x = 320.0;
			if(newLocation.y < 0.0)
				newLocation.y = 0.0;
			if(newLocation.y > 460.0)
				newLocation.y = 460.0;

		
		player.center = newLocation;
		
		CGPoint zero = CGPointMake(0.0, 0.0);
		[gesture setTranslation:zero inView:self.view];
	
	
}

-(void) actualizaScore {
 
    score += .01;
    scoreEnPantalla.text = [NSString stringWithFormat:@"%.2f",score];
    
}

-(void) checaColisiones {
    
    CGPoint center = player.center;
	CGPoint p1;
	CGPoint p2;
	CGPoint p3;
	CGPoint p4;
	
	double aumentox = ((player.bounds.size.width)/2)-5;
	double aumentoy = ((player.bounds.size.height)/2)-5;
	
	p1 = CGPointMake(center.x+aumentox, center.y+aumentoy);
	p2 = CGPointMake(center.x+aumentox, center.y-aumentoy);
	p3 = CGPointMake(center.x-aumentox, center.y+aumentoy);
	p4 = CGPointMake(center.x-aumentox, center.y-aumentoy);
    
    
	
	for(SmallEnemy *key in enemigos)
	{
		
		if ([self punto:p1 perteneceAlView:key] || [self punto:p2 perteneceAlView:key] || [self punto:p3 perteneceAlView:key] || [self punto:p4 perteneceAlView:key]) {
            
			[self seDetectoColision];
			break;
		}
	}
}

-(void) seDetectoColision {
    
    printf("Has perdido\n");
    
}

-(BOOL)punto:(CGPoint)punto perteneceAlView:(UIImageView *)imagen {
	
	BOOL res = NO;
	BOOL chocaX = NO;
	BOOL chocaY = NO;
	CGSize tamano = imagen.frame.size;
	
	double x1 = imagen.center.x - ((tamano.width)/2);
	double x2 = imagen.center.x + ((tamano.width)/2);
	double y1 = imagen.center.y - ((tamano.height)/2);
	double y2 = imagen.center.y + ((tamano.height)/2);
	
	if (punto.x <= x2 && punto.x >= x1) {
		chocaX = YES;
	}
	
	if (punto.y <= y2 && punto.y >= y1) {
		chocaY = YES;
	}
	
	if (chocaX && chocaY) {
		res = YES;
	}
	
	return res;
	
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
    self.scoreEnPantalla = nil;
	self.enemigos = nil;
    self.mueveEnemigos = nil;
    self.tactualizaScore = nil;
	
}

- (void)dealloc {
    [super dealloc];
}


@end
