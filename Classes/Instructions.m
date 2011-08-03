//
//  Instructions.m
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 8/2/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "Instructions.h"

@implementation Instructions

@synthesize delegate, backButton, nextButton, homeButton, image; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.nextButton.userInteractionEnabled = YES;
    self.backButton.userInteractionEnabled = YES;
    self.homeButton.userInteractionEnabled = YES;
    
    UIGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(next)];
    [nextButton addGestureRecognizer:gr];
    [gr release];
    
    gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [backButton addGestureRecognizer:gr];
    [gr release];
    
    gr = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(fromInstructionsToHome:)];
    [homeButton addGestureRecognizer:gr];
    [gr release];
    
    /*
     * Se inicializa el arreglo con las imagenes
     */
    
    imagenes = [[NSArray arrayWithObjects:[NSString stringWithFormat:@"3Tilt_Off.jpg"],
                                         [NSString stringWithFormat:@"2Tilt_On.jpg"],
                                         [NSString stringWithFormat:@"1Enemies.jpg"],
                                         [NSString stringWithFormat:@"4Items.jpg"],
                                         [NSString stringWithFormat:@"5Achievements.jpg"],
                 nil] retain];
     
    
    actual = 0;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) next {
    
    actual = actual + 1;
    if(actual == 5)
        actual = 0;
    self.image.image = [UIImage imageNamed:[imagenes objectAtIndex:actual]];
    
    
}

-(void) back {
    
    actual = actual - 1;
    if(actual == -1)
        actual = 4;
    self.image.image = [UIImage imageNamed:[imagenes objectAtIndex:actual]];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
