//
//  SmallEnemy.h
//  PlatyEscape
//
//  Created by José Rodrigo Pérez Rodríguez on 7/11/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SmallEnemy : UIImageView {
	
	CGPoint direccion;

}

@property CGPoint direccion;

-(id) initEnemyStyle:(int)style andFrame:(CGRect)frame;

@end
