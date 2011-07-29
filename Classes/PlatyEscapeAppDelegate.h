//
//  PlatyEscapeAppDelegate.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/7/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPrincipal.h"
#import "LevelSelector.h"
#import "Level1ViewController.h"
#import "ShopViewController.h"

@interface PlatyEscapeAppDelegate : NSObject <UIApplicationDelegate, MenuPrincipalDelegate, LevelSelectorDelegate, Level1ViewControllerDelegate, ShopViewControllerDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

