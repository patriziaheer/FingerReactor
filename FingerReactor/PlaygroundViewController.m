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
    [btnP1 release];
    [btnP2 release];
    [btnP3 release];
    [btnP4 release];
    [lblScoreP1 release];
    [lblScoreP2 release];
    [lblScoreP3 release];
    [lblScoreP4 release];
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
    [[btnP1 layer] setBackgroundColor:[UIColor grayColor]];

}


- (void)viewDidUnload
{
    [playgroundView release];
    [btnStart release];
    [lblWinner release];
    [btnP1 release];
    btnP1 = nil;
    [btnP2 release];
    btnP2 = nil;
    [btnP3 release];
    btnP3 = nil;
    [btnP4 release];
    btnP4 = nil;
    [lblScoreP1 release];
    lblScoreP1 = nil;
    [lblScoreP2 release];
    lblScoreP2 = nil;
    [lblScoreP3 release];
    lblScoreP3 = nil;
    [lblScoreP4 release];
    lblScoreP4 = nil;
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
    NSNumber *score = [NSNumber numberWithInt:([[lblScoreP1 text] intValue] + 1)];
    [lblScoreP1 setText:[score stringValue]];
    [self win:@"1"];
}

- (IBAction)p2clicked:(id)sender {
    NSNumber *score = [NSNumber numberWithInt:([[lblScoreP2 text] intValue] + 1)];
    [lblScoreP2 setText:[score stringValue]];
    [self win:@"2"];
}

- (IBAction)p3clicked:(id)sender {
    NSNumber *score = [NSNumber numberWithInt:([[lblScoreP3 text] intValue] + 1)];
    [lblScoreP3 setText:[score stringValue]];
    [self win:@"3"];
}

- (IBAction)p4clicked:(id)sender {
    NSNumber *score = [NSNumber numberWithInt:([[lblScoreP4 text] intValue] + 1)];
    [lblScoreP4 setText:[score stringValue]];
    [self win:@"4"];
}
@end
