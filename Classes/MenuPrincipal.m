//
//  MenuPrincipal.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/7/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "MenuPrincipal.h"


@implementation MenuPrincipal

@synthesize fondo, startGame, gameCenter, shop, instructions, delegate;




- (void)viewDidLoad {
	
	/*
	 * Primero vamos a inicializar la animación del fondo
	 */
    /*
	
	NSMutableString *str = [[NSMutableString alloc] init];
	UIImage *imagen;
	NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:50];
	int i;
    
	for (i=1; i<49; i++) {
		[str setString:@"HomeScreen0"];
		if(i<10)
			[str appendString:[NSString stringWithFormat:@"0%d.png",i]];
		else 
			[str appendString:[NSString stringWithFormat:@"%d.png",i]];
	
		imagen = [UIImage imageNamed:str];
		[arr addObject:imagen];
		[imagen release];
		imagen = nil;
		
	}
	
	fondo.animationImages = arr;
	fondo.animationDuration = 4.0;
	[fondo startAnimating];
	
	[arr release];
	[str release];
     */
	
	/*
	 * Terminamos la animación
	 */
	
	/*
	 * Comenzamos con la configuración de los botones
	 */
	
	startGame.userInteractionEnabled = YES;
	gameCenter.userInteractionEnabled = YES;
	shop.userInteractionEnabled = YES;
	instructions.userInteractionEnabled = YES;
	
	UIGestureRecognizer *startGamepressed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startB)];
	[startGame addGestureRecognizer:startGamepressed];
	[startGamepressed release];
	
	UIGestureRecognizer *gameCenterpressed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gameB)];
	[gameCenter addGestureRecognizer:gameCenterpressed];
	[gameCenterpressed release];
	
	UIGestureRecognizer *shoppressed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shopB)];
	[shop addGestureRecognizer:shoppressed];
	[shoppressed release];
	
	UIGestureRecognizer *instructionspressed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instructionsB)];
	[instructions addGestureRecognizer:instructionspressed];
	[instructionspressed release];
	
    [super viewDidLoad];
}



-(void) startB {

	[self.delegate gotoGame:self];
	
}


-(void) gameB {
	
	[self.delegate gotoGC:self];
}


-(void) shopB {
	
	[self.delegate gotoShop:self];
	
}


-(void) instructionsB {
	
	[self.delegate gotoInstructions:self];
	
}

-(void) releaseOutlets {
	self.fondo = nil;
	self.startGame = nil;
	self.gameCenter = nil;
	self.shop = nil;
	self.instructions = nil;

}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	
	[self releaseOutlets];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self releaseOutlets];
    [super dealloc];
}


@end
