//
//  FingerReactorViewController.m
//  FingerReactor
//
//  Created by Patrizia Heer on 28.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlaygroundViewController.h"
#include <stdlib.h>

@implementation PlaygroundViewController

@synthesize hasWinner;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (void)viewDidUnload
{
    [playgroundView release];
    [btnStart release];
    [lblWinner release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (IBAction)startClicked:(id)sender {
    [playgroundView setBackgroundColor:[UIColor blackColor]];
    [btnStart setHidden:true];
    [lblWinner setHidden:true];
    hasWinner = false;
    [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    int r = (random()%10)/2;
    NSLog(@"%i", r);
    sleep(r);
    [playgroundView setBackgroundColor:[UIColor greenColor]];
}

-(void)win:(NSString*)winner {
    if (hasWinner == false) {
        hasWinner = true;
        [btnStart setHidden:false];
        [lblWinner setHidden:false];
        NSString* winnerString = @"Player ";
        winnerString = [winnerString stringByAppendingString:winner];
        winnerString = [winnerString stringByAppendingString:@" wins"];
        [lblWinner setText:winnerString];
    }
}

- (IBAction)p1Clicked:(id)sender {
    [self win:@"1"];
}

- (IBAction)p2clicked:(id)sender {
    [self win:@"2"];
}

- (IBAction)p3clicked:(id)sender {
    [self win:@"3"];
}

- (IBAction)p4clicked:(id)sender {
    [self win:@"4"];
}
@end
