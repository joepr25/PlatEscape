//
//  Items.h
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 7/27/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Items : UIImageView {
    
    int identificador;
}

-(id) initWithImage:(UIImage *)image andId:(int)iden;

@end
