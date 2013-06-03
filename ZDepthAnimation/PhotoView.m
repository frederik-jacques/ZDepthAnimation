//
//  PhotoView.m
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import "PhotoView.h"

@implementation PhotoView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {

        UIImage *image = [UIImage imageNamed:@"background.png"];
        self.imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:self.imageView];
                
    }
    
    return self;
}



@end
