//
//  MainView.m
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.photoView = [[PhotoView alloc] initWithFrame:frame];
        [self addSubview:self.photoView];
        
        self.detailView = [[DetailView alloc] initWithFrame:CGRectMake(50, frame.size.height, 668, 400)];
        self.detailView.hidden = YES;
        [self addSubview:self.detailView];
        
        self.detailBar = [[DetailBar alloc] initWithFrame:CGRectMake(0, frame.size.height - 40, frame.size.width, 40)];
        [self addSubview:self.detailBar];
        
    }
    
    return self;
}

- (void)showDetail {
    
    self.detailView.hidden = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
       
        // 1. Animate detail view to center
        self.detailView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        
        // 2. Rotate photo view with perspective (check http://milen.me/technical/core-animation-3d-model/ for more info on the m34 property)
        self.photoView.layer.zPosition = -10;
        CATransform3D trRotate = CATransform3DIdentity;
        trRotate.m34 = 1.0 / -500; 
        self.photoView.layer.transform = CATransform3DRotate(trRotate, 5 * (M_PI / 180), 1, 0, 0);
        
        // 3. Hide detail bar
        CGRect detailBarFrame = self.detailBar.frame;
        detailBarFrame.origin.y = detailBarFrame.origin.y + detailBarFrame.size.height;
        self.detailBar.frame = detailBarFrame;
        
    } completion:^(BOOL finished) {
        // 1. Set alpha for 'inactive' feeling
        // 2. Scale photo view down for depth and resetting the rotation transformation
        [UIView animateWithDuration:0.2 animations:^{
            self.photoView.alpha = .5;
            self.photoView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
    }];

}

- (void)hideDetail {
    
    [UIView animateWithDuration:0.2 animations:^{
        
        // 1. Animate detail view outside the screen
        self.detailView.center = CGPointMake(self.frame.size.width / 2, -self.detailView.frame.size.height);
        
        // 2. Put photo view back in original state
        self.photoView.layer.zPosition = 0;
        CATransform3D trRotate = CATransform3DIdentity;
        trRotate.m34 = 1.0 / 500;
        self.photoView.layer.transform = CATransform3DRotate(trRotate, -5 * (M_PI / 180), 1, 0, 0);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
          
            // 1. Make photoview feel like active again
            // 2. Scale back to normal size
            self.photoView.alpha = 1;
            self.photoView.transform = CGAffineTransformMakeScale(1.0, 1.0);
          
            // 3. Show detail bar again
            CGRect detailBarFrame = self.detailBar.frame;
            detailBarFrame.origin.y = detailBarFrame.origin.y - detailBarFrame.size.height;
            self.detailBar.frame = detailBarFrame;
        } completion:^(BOOL finished) {
            // 1. Put photo detail back at the bottom
            self.detailView.frame = CGRectMake(50, self.frame.size.height, 668, 400);
            self.detailView.hidden = YES;
        }];
    }];
    
}

@end
