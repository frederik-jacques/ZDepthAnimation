//
//  MainViewController.m
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)loadView {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    self.mainView = [[MainView alloc] initWithFrame:bounds];
    self.view = self.mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.mainView.detailBar.btnInfo addTarget:self action:@selector(detailClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView.detailView.btnClose addTarget:self action:@selector(closeClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)detailClicked:(id)sender {
    NSLog(@"[MainVC] Detail button clicked");
    
    [self.mainView showDetail];
}

- (void)closeClicked:(id)sender {
    NSLog(@"[MainVC] Close button clicked");
    [self.mainView hideDetail];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
