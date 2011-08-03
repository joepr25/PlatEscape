//
//  Settings.m
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 8/2/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "Settings.h"

@implementation Settings

@synthesize difficulty, tilted, scored, sounded, delegate, back;

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
    
    /*
     * Se inicializan arreglos y dificultades
     */
    
    state = [[NSUserDefaults standardUserDefaults] integerForKey:@"state"];
    if(state == 0) {
        state = 2;
        [[NSUserDefaults standardUserDefaults] setInteger:state forKey:@"state"];
    }
    
    states = [[NSArray arrayWithObjects:[NSString stringWithFormat:@"Not Set"],
                                       [NSString stringWithFormat:@"Easy"],
                                       [NSString stringWithFormat:@"Normal"],
                                       [NSString stringWithFormat:@"Hard"],
              nil] retain];
    
    self.difficulty.text = [states objectAtIndex:state];
    
    /*
     * Se agregan opciones de inicio
     */
    BOOL tilt = [[NSUserDefaults standardUserDefaults] boolForKey:@"tilt"];
    if (tilt) {
        [self.tilted setOn:YES animated:NO];
    }
    BOOL sound = [[NSUserDefaults standardUserDefaults] boolForKey:@"sound"];
    if (sound) {
        [self.sounded setOn:NO animated:NO];
    }
    BOOL score = [[NSUserDefaults standardUserDefaults] boolForKey:@"scoreActivated"];
    if (score) {
        [self.scored setOn:NO animated:NO];
    }
    
    self.difficulty.userInteractionEnabled = YES;
    UIGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(difficultyChanged)];
    [self.difficulty addGestureRecognizer:gr];
    [gr release];
    
    self.back.userInteractionEnabled = YES;
    gr = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(fromSettingsToMenu:)];
    [self.back addGestureRecognizer:gr];
    [gr release];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction) tiltness:(UISwitch *)sender {
    
    if(sender.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"tilt"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"tilt"];
}

-(IBAction) soundness:(UISwitch *)sender {
    
    
}

-(IBAction) score:(UISwitch *)sender {
    
    
}

-(void) difficultyChanged {
    
    state ++;
    if(state == 4)
        state = 1;
    
    self.difficulty.text = [states objectAtIndex:state];
    [[NSUserDefaults standardUserDefaults] setInteger:state forKey:@"state"];

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
