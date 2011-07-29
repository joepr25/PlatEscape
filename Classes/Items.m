//
//  Items.m
//  PlatyEscape
//
//  Created by Jose Rodrigo PEREZ RODRIGUEZ on 7/27/11.
//  Copyright 2011 Itesm Campus Puebla. All rights reserved.
//

#import "Items.h"

@implementation Items

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithImage:(UIImage *)image andId:(int)iden {
    
    self = [super initWithImage:image];
    if(self) {
        
        identificador = iden;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
