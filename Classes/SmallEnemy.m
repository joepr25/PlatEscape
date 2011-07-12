//
//  SmallEnemy.m
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/11/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "SmallEnemy.h"


@implementation SmallEnemy

@synthesize direccion;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

-(id)initEnemyStyle:(int)style andFrame:(CGRect)frame {

	self = [super initWithFrame:frame];
	if (self) {
		//self.image = [UIImage imageNamed:];
	}
	
	return self;
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
