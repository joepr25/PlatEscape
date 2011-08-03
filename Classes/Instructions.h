//
//  Instructions.h
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 8/2/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Instructions;

@protocol InstructionsDelegate

-(void) fromInstructionsToHome:(Instructions *)requester;

@end

@interface Instructions : UIViewController {
    id <InstructionsDelegate> delegate;
    NSArray *imagenes;
    int actual;
}

@property (retain) id <InstructionsDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UIImageView *backButton;
@property (nonatomic, retain) IBOutlet UIImageView *nextButton;
@property (nonatomic, retain) IBOutlet UIImageView *homeButton;

-(void) next;
-(void) back;


@end
