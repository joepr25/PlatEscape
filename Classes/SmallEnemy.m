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



-(id) initWithImage:(UIImage *)image inQuadrant:(int)quadrant{
	
	srand(time(NULL));

	self = [super initWithImage:image];
	if (self) {
		
		direccion.x = (rand()%3)+4.0;
		direccion.y = (rand()%3)+4.0;
        
        switch (quadrant) {
            case 4:
                
                break;
            case 3:
                direccion.x = -direccion.x;
                break;
            case 2:
                direccion.y = -direccion.y;
                break;
            case 1:
                direccion.x = -direccion.x;
                direccion.y = -direccion.y;
                break;

        }

		
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
