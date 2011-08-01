//
//  ShopViewController.m
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 7/29/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "ShopViewController.h"

@implementation ShopViewController

@synthesize delegate, backButton, harryButton, smurfButton, noCostumeButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        

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
    
    
    self.backButton.userInteractionEnabled = YES;
    UIGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(fromShopToHome:)];
    [self.backButton addGestureRecognizer:tgr];
    [tgr release];
    
    self.harryButton.userInteractionEnabled = YES;
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(harryPressed)];
    [self.harryButton addGestureRecognizer:tgr];
    [tgr release];
    
    self.smurfButton.userInteractionEnabled = YES;
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(smurfPressed)];
    [self.smurfButton addGestureRecognizer:tgr];
    [tgr release];
    
    self.noCostumeButton.userInteractionEnabled = YES;
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noCostumePressed)];
    [self.noCostumeButton addGestureRecognizer:tgr];
    [tgr release]; 
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) releaseOutlets {
    
    self.backButton = nil;
    self.harryButton = nil;
    self.smurfButton = nil;
    self.noCostumeButton = nil;
}

- (void)viewDidUnload
{
    [self   releaseOutlets];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) harryPressed {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"PlattyPotter.png"] forKey:@"playerImage"];
}

-(void) smurfPressed {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"Platytufo.png"] forKey:@"playerImage"];

}

-(void) noCostumePressed {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"PlatSoul.png"] forKey:@"playerImage"];
    
}

-(void) dealloc {
    
    [self releaseOutlets];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
