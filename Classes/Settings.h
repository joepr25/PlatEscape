//
//  Settings.h
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 8/2/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Settings;

@protocol SettingsDelegate

-(void) fromSettingsToMenu:(Settings *)requester;

@end

@interface Settings : UIViewController {
    
    id <SettingsDelegate> delegate;
    NSArray *states;
    int state;
}

@property (nonatomic, retain) IBOutlet UILabel *difficulty;
@property (nonatomic, retain) IBOutlet UIImageView *back;
@property (nonatomic, retain) IBOutlet UISwitch *tilted;
@property (nonatomic, retain) IBOutlet UISwitch *scored;
@property (nonatomic, retain) IBOutlet UISwitch *sounded;
@property (retain) id <SettingsDelegate> delegate;



-(IBAction) tiltness:(UISwitch *)sender;
-(IBAction) soundness:(UISwitch *)sender;
-(IBAction) score:(UISwitch *)sender;
-(void) difficultyChanged;

@end
