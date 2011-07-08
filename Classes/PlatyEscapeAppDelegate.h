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

@interface PlatyEscapeAppDelegate : NSObject <UIApplicationDelegate, MenuPrincipalDelegate, LevelSelectorDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

