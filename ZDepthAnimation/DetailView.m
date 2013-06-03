//
//  DetailView.m
//  ZDepthAnimation
//
//  Created by Frederik Jacques on 03/06/13.
//  Copyright (c) 2013 the-nerd. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5;
        self.layer.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1].CGColor;
        
        UIImage *image = [UIImage imageNamed:@"close.png"];
        self.btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnClose.frame = CGRectMake(frame.size.width - 40, 10, image.size.width, image.size.height);
        [self.btnClose setBackgroundImage:image forState:UIControlStateNormal];
        [self addSubview:self.btnClose];
        
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(15, 55, frame.size.width - 30, frame.size.height - 70)];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Jemaa_el-Fnaa"]]];
        [self addSubview:self.webView];
        
    }
    return self;
}

@end
