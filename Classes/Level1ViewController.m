//
//  Level1ViewController.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/10/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "Level1ViewController.h"


@implementation Level1ViewController

@synthesize player, fondo, enemigos, score, delegate, enemyCount, scoreEnPantalla, mueveEnemigos, tactualizaScore, tchecaColisiones, alert, agregaEnemigos, item, agregaItems, itemIsOut, itemCount, quitaItem, isInPause, pauseMode, accelerometer;

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
    
    tilt = [[NSUserDefaults standardUserDefaults] boolForKey:@"tilt"];
    NSString *imagen = [[NSUserDefaults standardUserDefaults] stringForKey:@"playerImage"];
    
    if (imagen) {
        player.image = [UIImage imageNamed:imagen];
    }
    [player sizeToFit];
    
	self.enemigos = [[NSMutableArray alloc] initWithCapacity:50];
    self.score = 0.00;
    self.enemyCount = 0;
    player.frame = CGRectMake(145, 205, 31, 50);
    self.scoreEnPantalla.text = @"0.00";
    self.itemIsOut = NO;
    self.itemCount = 0;
    self.isInPause = NO;
    self.scoreEnPantalla.userInteractionEnabled = YES;
    UIGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPause:)];
    [self.scoreEnPantalla addGestureRecognizer:gr];
    [gr release];
    
    if(tilt) {
        accelerometer = [UIAccelerometer sharedAccelerometer];
        accelerometer.updateInterval = .1;
        accelerometer.delegate = self;
    }
    
    
    /*
     * Lanzamos los timers
     */
    
    srand(time(NULL));
    int first = (rand()%10 + 50);
    int second = (rand()%100);
    double time = [[[NSString stringWithFormat:@"%d.",first] stringByAppendingString:[NSString stringWithFormat:@"%d",second]] doubleValue];
    
    printf("Se agregará un item a las %.2f\n",time);
    
	self.agregaEnemigos = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(addEnemy) userInfo:nil repeats:NO];
    time1 = 2.0;
	self.mueveEnemigos = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveEnemy) userInfo:nil repeats:YES];
    self.tactualizaScore = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(actualizaScore) userInfo:nil repeats:YES];
    self.tchecaColisiones = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checaColisiones) userInfo:nil repeats:YES];
    self.agregaItems = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(addKeyItem) userInfo:nil repeats:NO];
    time2 = time;
    
    time3 = 0.00;
	
}

-(void) showPause:(UITapGestureRecognizer *)tpr{
    
    [mueveEnemigos invalidate];
    [tactualizaScore invalidate];
    [tchecaColisiones invalidate];
    [agregaEnemigos invalidate];
    [agregaItems invalidate];
    [quitaItem invalidate];
    
    self.mueveEnemigos = nil;
    self.tactualizaScore = nil;
    self.tchecaColisiones = nil;
    self.agregaEnemigos = nil;
    self.agregaItems = nil;
    self.quitaItem = nil;
    
    printf("time1:%.2f\n time2:%.2f\n time3:%.2f\n",time1, time2, time3);
    
    
    self.isInPause = YES;
    
    self.pauseMode = [[UIAlertView alloc] initWithTitle:@"Pause" 
                                                message:nil 
                                               delegate:self 
                                      cancelButtonTitle:nil 
                                      otherButtonTitles:@"Resume Game", @"Enable/Disable Tilt" , @"Restart Game", @"Return to Level Select", @"Return to Main Menu", nil];
    [pauseMode show];
    
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

	[agregaEnemigos invalidate];
    self.agregaEnemigos = nil;
    
	//Checa en que cuadrante esta el usuario
	int quad = [self quadrant];

	
	//Crea al enemigo inicializandolo con una velocidad
	CGRect frame;
    double tamano = 35.0;
    
	switch (quad) {
		case 1:
			frame = CGRectMake(288, 420, tamano, tamano);
			break;
		case 2:
			frame = CGRectMake(20, 420, tamano, tamano);
			break;
		case 3:
			frame = CGRectMake(280, 20, tamano, tamano);
			break;
		case 4:
			frame = CGRectMake(20, 13, tamano, tamano);
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
    printf("Hay %d enemigos\n", enemyCount);
    if(enemyCount > 20)
        printf("Se llego al limite de enemigos\n");
    else
    {
        self.agregaEnemigos = [NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(addEnemy) userInfo:nil repeats:NO];
        time1 = 6.0;
    }

	
}

-(void) addKeyItem {
    
    CGRect frame;
    double tamano = 40;
    srand(time(NULL));
    
    self.item = [[Items alloc] initWithImage:[UIImage imageNamed:@"Key.png"] andId:1];
    
    double rand1 = rand()%280;
    double rand2 = rand()%420;
    
    
    frame = CGRectMake(rand1, rand2, tamano, tamano);
    item.frame = frame;
    
    [self.view insertSubview:item aboveSubview:player];
    self.itemIsOut = YES;
    
    printf("Se agregó un item en la posicion %.0f y %.0f\n",rand1, rand2);
    
    time2 = 0.00;
    
    self.quitaItem = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(removeKeyItem) userInfo:nil repeats:NO];
    time3 = 10.0;
    
    
}

-(void) movePlayer:(UIPanGestureRecognizer *)gesture {

    if(!tilt)
    {
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
	
	
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    if(tilt && !isInPause)
    {
        double x = player.center.x + (acceleration.x * 70);
        double y = player.center.y - ((acceleration.y + 0.5) * 70);
    
        if(x<0.0)
            x=0.0;
        if(x>320.0)
            x=320.0;
        if(y<0.0)
            y=0.0;
        if(y>460.0)
            y=460;
    
    
        player.center = CGPointMake(x, y);
    }
    
}

-(void) removeKeyItem {
    
    [item removeFromSuperview];
    printf("No Tomaste el item\n");
    srand(time(NULL));
    int first = (rand()%10 + 50);
    int second = (rand()%100);
    double time = [[[NSString stringWithFormat:@"%d.",first] stringByAppendingString:[NSString stringWithFormat:@"%d",second]] doubleValue];
    
    self.agregaItems = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(addKeyItem) userInfo:nil repeats:NO];
    time2 = time;
    printf("Se agregará un item a las %.2f\n",time+score);

    self.itemIsOut = NO;
    
}

-(void) actualizaScore {
 
    score += .01;
    
    if([agregaEnemigos isValid] && time1 > 0.00)
        time1 -= .01;
    if ([agregaItems isValid] && time2 > 0.00) 
        time2 -= .01;
    if([quitaItem isValid] && time3 > 0.00)
        time3 -= .01;
    
    self.scoreEnPantalla.text = [NSString stringWithFormat:@"%.2f",score];
    
}

-(void) checaColisiones {
    
    CGPoint center = player.center;
	CGPoint p1;
	CGPoint p2;
	CGPoint p3;
	CGPoint p4;
	
	double aumentox = ((player.bounds.size.width)/2)-10;
	double aumentoy = ((player.bounds.size.height)/2)-10;
	
	p1 = CGPointMake(center.x+aumentox, center.y+aumentoy);
	p2 = CGPointMake(center.x+aumentox, center.y-aumentoy);
	p3 = CGPointMake(center.x-aumentox, center.y+aumentoy);
	p4 = CGPointMake(center.x-aumentox, center.y-aumentoy);
    
    
	
	for(SmallEnemy *key in enemigos)
	{
		
		if ([self punto:p1 perteneceAlView:key] || [self punto:p2 perteneceAlView:key] || [self punto:p3 perteneceAlView:key] || [self punto:p4 perteneceAlView:key]) {
            
            /*
             * Si entra aquí quiere decir que el usuario perdió
             */
            
            //Se reinicializan todos los timers.
            [mueveEnemigos invalidate];
            [tactualizaScore invalidate];
            [tchecaColisiones invalidate];
            [agregaEnemigos invalidate];
            [agregaItems invalidate];
            if([quitaItem isValid])
                [quitaItem invalidate];
            
            self.quitaItem = nil;
            self.mueveEnemigos = nil;
            self.tactualizaScore = nil;
            self.tchecaColisiones = nil;
            self.agregaEnemigos = nil;
            self.agregaItems = nil;
            tilt = NO;
            
            if (itemIsOut) [item removeFromSuperview];
            
            //Se quitan todos los enemigos existentes de la pantalla
            for(SmallEnemy *key in enemigos)
            {
                [key removeFromSuperview];
            }
            
            //Se borra el arreglo de los enemigos
            self.enemigos = nil;
            
            //Se muestra el dialogo de opciones para poder volver a jugar.
            
            NSString *display;
            if(itemCount == 1)
                display = [NSString stringWithFormat:@"Congratulations, you've achived a score of %.2f and caught %d item", score, itemCount];
            else
                display = [NSString stringWithFormat:@"Congratulations, you've achived a score of %.2f and caught %d items", score, itemCount];
            
            self.alert = [[UIAlertView alloc] initWithTitle:@"Game Over" 
                                                            message:display
                                                           delegate:self 
                                                  cancelButtonTitle:nil 
                                                  otherButtonTitles:@"Play Again", @"Return to Level Select", @"Return to Main Menu" ,nil];
            [alert show];

			break;
		}
	}
    
    if(itemIsOut)
    {
        if ([self punto:p1 perteneceAlView:item] || [self punto:p2 perteneceAlView:item] || [self punto:p3 perteneceAlView:item] || [self punto:p4 perteneceAlView:item]) {
            
            time3 = 0.00;
            [item removeFromSuperview];
            printf("Tomaste Satisfactoriamente el item\n");
            srand(time(NULL));
            int first = (rand()%10 + 50);
            int second = (rand()%100);
            double time = [[[NSString stringWithFormat:@"%d.",first] stringByAppendingString:[NSString stringWithFormat:@"%d",second]] doubleValue];
            
            self.agregaItems = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(addKeyItem) userInfo:nil repeats:NO];
            time2 = time;
            self.itemCount++;
            self.itemIsOut = NO;
            
            [quitaItem invalidate];
            self.quitaItem = nil;
            printf("Se agregará un item a las %.2f\n",time+score);

            
            
            
        }
    }
}



-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    int x = buttonIndex;
    printf("Se apretó el boton %d\n",x);
    
    //Alert que se presenta cuando pierdes
    if(alertView == alert)
    {
        if (buttonIndex == 1) {
            [self.delegate returnToLevelSelect:self];
        }
        else
        {
            if (buttonIndex == 0) {
                [self startTimers];
            }
            else
            {
                if (buttonIndex == 2) {
                    [self.delegate returnToMainM:self];
                }
            }
        }
    }
    
    //Alert que se presenta cuando le pones pausa
    if (alertView == pauseMode) {
        switch (buttonIndex) {
            case 0:
                self.mueveEnemigos = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moveEnemy) userInfo:nil repeats:YES];
                self.tactualizaScore = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(actualizaScore) userInfo:nil repeats:YES];
                self.tchecaColisiones = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checaColisiones) userInfo:nil repeats:YES];
                if(time1 != 0.00)
                    self.agregaEnemigos = [NSTimer scheduledTimerWithTimeInterval:time1 target:self selector:@selector(addEnemy) userInfo:nil repeats:NO];
                if(time2 != 0.00)
                    self.agregaItems = [NSTimer scheduledTimerWithTimeInterval:time2 target:self selector:@selector(addKeyItem) userInfo:nil repeats:NO];
                if(time3 != 0.00)
                    self.quitaItem = [NSTimer scheduledTimerWithTimeInterval:time3 target:self selector:@selector(removeKeyItem) userInfo:nil repeats:NO];
                
                self.isInPause = NO;
                
                break;
                
            case 1:
                
                break;
            case 2:
                
                //Se quitan todos los enemigos existentes de la pantalla
                
                if (itemIsOut) [item removeFromSuperview];
                
                for(SmallEnemy *key in enemigos)
                {
                    [key removeFromSuperview];
                }
                
                //Se borra el arreglo de los enemigos
                self.enemigos = nil;
                
                [self startTimers];
                
                break;
                
            case 3:
                
                //Se quitan todos los enemigos existentes de la pantalla

                if (itemIsOut) [item removeFromSuperview];
                
                for(SmallEnemy *key in enemigos)
                {
                    [key removeFromSuperview];
                }
                
                //Se borra el arreglo de los enemigos
                self.enemigos = nil;
                
                [self.delegate returnToLevelSelect:self];

                break;
                
            case 4:
                //Se quitan todos los enemigos existentes de la pantalla
                
                if (itemIsOut) [item removeFromSuperview];
                
                for(SmallEnemy *key in enemigos)
                {
                    [key removeFromSuperview];
                }
                
                //Se borra el arreglo de los enemigos
                self.enemigos = nil;
                
                [self.delegate returnToMainM:self];
                
                break;

        }
        
    }
    
    

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
    self.accelerometer.delegate = nil;
    [self releaseOutlets];
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
    self.alert = nil;
    self.agregaEnemigos = nil;
    self.agregaItems = nil;
    self.item = nil;
    self.quitaItem = nil;
    self.pauseMode = nil;
	
}

- (void)dealloc {
    self.accelerometer.delegate = nil;
    [self releaseOutlets];
    [super dealloc];
}


@end
