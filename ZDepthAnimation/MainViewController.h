//
//  MainViewController.h
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "DetailView.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) MainView *mainView;
@property (nonatomic, strong) DetailView *detailView;

@end
