//
//  DetailBar.m
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import "DetailBar.h"

@implementation DetailBar

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    
    if (self) {        
        self.backgroundColor = [UIColor colorWithRed:239/255.0f green:64/255.0f blue:35/255.0f alpha:0.8f];
        
        UIImage *image = [UIImage imageNamed:@"detail.png"];
        self.btnInfo = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnInfo.frame = CGRectMake(5, 5, image.size.width, image.size.height);
        [self.btnInfo setBackgroundImage:image forState:UIControlStateNormal];
        [self addSubview:self.btnInfo];
    }
    
    return self;
}

@end
