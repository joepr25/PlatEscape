//
//  PlatyEscapeAppDelegate.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/7/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "PlatyEscapeAppDelegate.h"

@implementation PlatyEscapeAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	MenuPrincipal *vc = [[MenuPrincipal alloc] init];
    vc.view.frame = [[UIScreen mainScreen] applicationFrame];
	vc.delegate = self;
	[self.window addSubview:vc.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release sharedfile://localhost/Users/joepr25/Developer/PlatyEscape/LevelSelector.xib resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

-(void) gotoGame:(MenuPrincipal *)requester {

	[requester.view removeFromSuperview];
	[requester release];
	requester = nil;
	LevelSelector *lvc = [[LevelSelector alloc] init];
	lvc.delegate = self;
	lvc.view.frame = [[UIScreen mainScreen] applicationFrame];
	[self.window addSubview:lvc.view];
	
}

-(void) goToHome:(LevelSelector *)requester {

	[requester.view removeFromSuperview];
	[requester release];
	requester = nil;
	MenuPrincipal *lvc = [[MenuPrincipal alloc] init];
	lvc.delegate = self;
	lvc.view.frame = [[UIScreen mainScreen] applicationFrame];
	[self.window addSubview:lvc.view];
}

-(void) returnToLevelSelect:(Level1ViewController *)requester {
    
	[requester.view removeFromSuperview];
	[requester release];
	requester = nil;
	LevelSelector *lvc = [[LevelSelector alloc] init];
	lvc.delegate = self;
	lvc.view.frame = [[UIScreen mainScreen] applicationFrame];
	[self.window addSubview:lvc.view];
}

-(void) returnToMainM:(Level1ViewController *)requester {
    
    [requester.view removeFromSuperview];
	[requester release];
	requester = nil;
	MenuPrincipal *lvc = [[MenuPrincipal alloc] init];
	lvc.delegate = self;
	lvc.view.frame = [[UIScreen mainScreen] applicationFrame];
	[self.window addSubview:lvc.view];
}

-(void) goToLevel1:(LevelSelector *)requester {

	[requester.view removeFromSuperview];
	[requester release];
	requester = nil;
	Level1ViewController *lvc = [[Level1ViewController alloc] init];
	lvc.delegate = self;
	lvc.view.frame = [[UIScreen mainScreen] applicationFrame];
	[self.window addSubview:lvc.view];
}

-(void) fromShopToHome:(ShopViewController *)requester {
    
    [requester.view removeFromSuperview];
	[requester release];
	requester = nil;
	MenuPrincipal *lvc = [[MenuPrincipal alloc] init];
	lvc.delegate = self;
	lvc.view.frame = [[UIScreen mainScreen] applicationFrame];
	[self.window addSubview:lvc.view];
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
