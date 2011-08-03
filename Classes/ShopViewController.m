//
//  ShopViewController.m
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 7/29/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "ShopViewController.h"

@implementation ShopViewController

@synthesize delegate, backButton, nextButton, previousButton, image, costume, text, on;

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
    
    /*
     * Se configuran los botones
     */
    
    
    self.backButton.userInteractionEnabled = YES;
    UIGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(fromShopToHome:)];
    [self.backButton addGestureRecognizer:tgr];
    [tgr release];
    
    self.nextButton.userInteractionEnabled = YES;
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextButtonPressed)];
    [self.nextButton addGestureRecognizer:tgr];
    [tgr release];
    
    self.previousButton.userInteractionEnabled = YES;
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(previousButtonPressed)];
    [self.previousButton addGestureRecognizer:tgr];
    [tgr release];
    
    self.costume.userInteractionEnabled = YES;
    tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectCostume)];
    [self.costume addGestureRecognizer:tgr];
    [tgr release];
    
    /*
     * Se inicializan los arreglos
     */
    
    
    
    costumes = [[NSArray arrayWithObjects:[[NSString stringWithFormat:@"Plat_Estatico_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"PlatySan_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"Platynja_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"EnmascaradoDePlaty_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"PlatyCullen_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"Platybrains_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"Platytufo_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"PlattyPotter_SHOP.png"] retain],
                                         [[NSString stringWithFormat:@"PlatSoul_SHOP.png"] retain],
                nil] retain];
    
    icons = [[NSArray arrayWithObjects:[[NSString stringWithFormat:@""] retain],
              [[NSString stringWithFormat:@"Karate_Icon.png"] retain],
              [[NSString stringWithFormat:@"Ninja_Icon.png"] retain],
              [[NSString stringWithFormat:@"EnmascaradoDePlaty_Icon.png"] retain],
              [[NSString stringWithFormat:@"Vampiro_Icon"] retain],
              [[NSString stringWithFormat:@"Zombie_Icon.png"] retain],
              [[NSString stringWithFormat:@"Platytufo_Icon.png"] retain],
              [[NSString stringWithFormat:@"PlattyPotter_Icon.png"] retain],
              [[NSString stringWithFormat:@"Soul_Icon.png"] retain],
              nil] 
             retain];
    
    selected = [[NSUserDefaults standardUserDefaults] integerForKey:@"selectedCostume"];
    actual = selected;
    
    NSString *msj = [NSString stringWithFormat:@"%d/9",actual+1];
    self.text.text = msj;
    
    self.costume.image = [UIImage imageNamed:[costumes objectAtIndex:actual]];
    [self.costume sizeToFit];
    self.costume.center = CGPointMake(160, 188);
    
    self.image.image = [UIImage imageNamed:[icons objectAtIndex:actual]];
    [self.image sizeToFit];
    self.image.center = CGPointMake(160, 366);
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) nextButtonPressed{
    
    if (actual < 8) 
    {        
        actual = actual + 1;
        NSString *nombre = [costumes objectAtIndex:actual];
        self.costume.image = [UIImage imageNamed:nombre];
        [self.costume sizeToFit];
        self.costume.center = CGPointMake(160, 188);
        NSString *msj = [NSString stringWithFormat:@"%d/9",actual+1];
        self.text.text = msj;
        
        self.image.image = [UIImage imageNamed:[icons objectAtIndex:actual]];
        [self.image sizeToFit];
        self.image.center = CGPointMake(160, 366);
        
        if (actual == selected)
            self.on.hidden =  NO;
        else
            self.on.hidden = YES;
    }
}

-(void) previousButtonPressed{
    
    if (actual > 0) 
    {        
        actual = actual - 1;
        NSString *nombre = [costumes objectAtIndex:actual];
        self.costume.image = [UIImage imageNamed:nombre];
        [self.costume sizeToFit];
        self.costume.center = CGPointMake(160, 188);
        NSString *msj = [NSString stringWithFormat:@"%d/9",actual+1];
        self.text.text = msj;
        
        self.image.image = [UIImage imageNamed:[icons objectAtIndex:actual]];
        [self.image sizeToFit];
        self.image.center = CGPointMake(160, 366);
        
        if (actual == selected)
            self.on.hidden =  NO;
        else
            self.on.hidden = YES;

    }
    
}

-(void) selectCostume{
    
    selected = actual;
    [[NSUserDefaults standardUserDefaults] setInteger:actual forKey:@"selectedCostume"];
    switch (actual) {
        case 0:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"Plat_Estatico.png"] forKey:@"playerImage"];
            break;
        case 1:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"PlatySan.png"] forKey:@"playerImage"];
            break;
        case 2:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"Platynja.png"] forKey:@"playerImage"];
            break;
        case 3:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"EnmascaradoDePlaty.png"] forKey:@"playerImage"];
            break;
        case 4:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"PlatyCullen.png"] forKey:@"playerImage"];
            break;
        case 5:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"Platybrains.png"] forKey:@"playerImage"];
            break;
        case 6:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"Platytufo.png"] forKey:@"playerImage"];
            break;
        case 7:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"PlattyPotter.png"] forKey:@"playerImage"];
            break;
        case 8:
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"PlatSoul.png"] forKey:@"playerImage"];
            break;
            
    }
    
    self.on.hidden = NO;
    
}

-(void) releaseOutlets {
    
    self.backButton = nil;
    self.nextButton = nil;
    self.previousButton = nil;
    self.image = nil;
    self.costume = nil;
    self.text = nil;
    [costumes release];
    costumes = nil;
    [icons release];
    icons = nil;
    self.on = nil;
    

}

- (void)viewDidUnload
{
    [self   releaseOutlets];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
