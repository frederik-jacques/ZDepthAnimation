//
//  MainView.h
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoView.h"
#import "DetailView.h"
#import "DetailBar.h"

@interface MainView : UIView

@property (nonatomic, strong) PhotoView *photoView;
@property (nonatomic, strong) DetailView *detailView;
@property (nonatomic, strong) DetailBar *detailBar;

- (void)showDetail;
- (void)hideDetail;

@end
