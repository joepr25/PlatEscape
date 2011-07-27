//
//  LevelSelector.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/7/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "LevelSelector.h"


@implementation LevelSelector

@synthesize fondo, delegate, level1, level2, back;

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


- (void)viewDidLoad {
	
	/*
	 * Vamos a inicializar los botones de tal manera que sean funcionales
	 */
	
	level1.userInteractionEnabled = YES;
	level2.userInteractionEnabled = YES;
	back.userInteractionEnabled = YES;
	
	UIGestureRecognizer *l1gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(level1Pressed)];
	[level1 addGestureRecognizer:l1gr];
	[l1gr release];
	
	UIGestureRecognizer *l2gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(level2Pressed)];
	[level2 addGestureRecognizer:l2gr];
	[l2gr release];
	
	UIGestureRecognizer *bgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(home)];
	[back addGestureRecognizer:bgr];
	[bgr release];
	
	
	/*
	 * Ahora vamos a crear la animación del fondo
	 */
	
	
	NSMutableString *name = [[NSMutableString alloc] init];
	UIImage *imagen;
	NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:50];
	int i;
	for (i=1; i<49; i++) {
		
		[name setString:@"LevelSelect0"];
		if (i<10)
			[name appendString:[NSString stringWithFormat:@"0%d.png", i]];
		else
			[name appendString:[NSString stringWithFormat:@"%d.png", i]];
		
		imagen = [UIImage imageNamed:name];
		[arr addObject:imagen];
		[imagen release];
		imagen = nil;
		
	}
	
	self.fondo.animationImages = arr;
	self.fondo.animationDuration = 4.0;
	[arr release];
	[name release];
    [super viewDidLoad];
	[self.fondo startAnimating];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void) level1Pressed {
	
	[self.delegate goToLevel1:self];
	
}

-(void) level2Pressed {
	
	[self.delegate goToLevel2:self];
}

-(void) home {
	
	[self.delegate goToHome:self];
}

-(void) releaseOutlets {

	self.fondo = nil;
    self.level1 = nil;
    self.level2 = nil;
    self.back = nil;
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	
	[self releaseOutlets];
    [super viewDidUnload];
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self releaseOutlets];
    [super dealloc];
}


@end
