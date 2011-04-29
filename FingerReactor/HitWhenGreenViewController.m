//
//  HitWhenGreenViewController.m
//  FingerReactor
//
//  Created by Patrizia Heer on 29.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HitWhenGreenViewController.h"


@implementation HitWhenGreenViewController

@synthesize roundRunning;

- (void)dealloc {
    [playgroundView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [playgroundView release];
    playgroundView = nil;
    [super viewDidUnload];
}

-(void)play {
    [playgroundView setBackgroundColor:[UIColor blackColor]];
    int r = (random()%10)/2;
    NSLog(@"%i", r);
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:r target:self selector:@selector(colorTimer:) userInfo:nil repeats:NO];
}

- (void)colorTimer:(NSTimer *)timer
{
    [playgroundView setBackgroundColor:[UIColor greenColor]];
    roundRunning = true;
}

@end
