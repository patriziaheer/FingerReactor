//
//  FingerReactorViewController.m
//  FingerReactor
//
//  Created by Patrizia Heer on 28.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlaygroundViewController.h"
#import "HitWhenGreenViewController.h"
#include <stdlib.h>

@implementation PlaygroundViewController

@synthesize hasWinner;

- (void)dealloc
{
    [lblScoreP1 release];
    [lblScoreP2 release];
    [lblScoreP3 release];
    [lblScoreP4 release];
    [btnP1 release];
    [btnP2 release];
    [btnP3 release];
    [btnP4 release];
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
    round = 0;
    NSLog(@"r: %i", round);
    [btnPlayAgain setHidden:true];
    int y = 0;
    
    NSString *deviceType = [UIDevice currentDevice].model;
    if ([deviceType rangeOfString:@"iPad"].location != NSNotFound) {
        hitWhenGreenViewController = [[HitWhenGreenViewController alloc] initWithNibName:@"HitWhenGreenViewIPad" bundle:nil];
        y = 258;
    } else {
        hitWhenGreenViewController = [[HitWhenGreenViewController alloc] initWithNibName:@"HitWhenGreenViewIPhone" bundle:nil];
        y = 128;
    }
    NSLog(@"y: %i", y);
    
    CGSize size = [[hitWhenGreenViewController view] frame].size;
    CGRect frameRect = CGRectMake(0, y, size.width, size.height);
    [[hitWhenGreenViewController view] setFrame:frameRect];
    
    [self.view addSubview:[hitWhenGreenViewController view]];
    [self.view bringSubviewToFront:lblWinner];
    [self.view bringSubviewToFront:btnPlayAgain];
    currController = hitWhenGreenViewController;
}

-(void)viewDidAppear:(BOOL)animated {
    [lblWinner setText:@"3"];
    [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    sleep(1);
    [lblWinner setText:@"2"];
    [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    sleep(1);
    [lblWinner setText:@"1"];
    [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    sleep(1);
    [lblWinner setText:@"LOS"];
    [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    sleep(1);
    
    
    [self play];
}


- (void)viewDidUnload
{
    [btnPlayAgain release];
    [lblWinner release];
    [lblScoreP1 release];
    lblScoreP1 = nil;
    [lblScoreP2 release];
    lblScoreP2 = nil;
    [lblScoreP3 release];
    lblScoreP3 = nil;
    [lblScoreP4 release];
    lblScoreP4 = nil;
    [btnP1 release];
    btnP1 = nil;
    [btnP2 release];
    btnP2 = nil;
    [btnP3 release];
    btnP3 = nil;
    [btnP4 release];
    btnP4 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)play {
    NSLog(@"round %i", round);
    round = round + 1;
    NSLog(@"round %i", round);
    [self enableButtons:true];
    [btnPlayAgain setHidden:true];
    [lblWinner setHidden:true];
    hasWinner = false;
    //[[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    [currController play];
}


-(void)enableButtons:(Boolean*) enable {
    [btnP1 setEnabled:enable];
    [btnP2 setEnabled:enable];
    [btnP3 setEnabled:enable];
    [btnP4 setEnabled:enable];
}


- (IBAction)playAgainClicked:(id)sender {
    round = 0;
    [lblScoreP1 setText:@"0"];
    [lblScoreP2 setText:@"0"];
    [lblScoreP3 setText:@"0"];
    [lblScoreP4 setText:@"0"];
    [self play];
}

-(void)win:(NSString*)winner label:(UILabel*)lbl {
    if (hasWinner == false) {
        hasWinner = true;
        [currController setRoundRunning:false];
        [self enableButtons:false];
        
        //calculate new score
        NSNumber *score = [NSNumber numberWithInt:([[lbl text] intValue] + 1)];
        [lbl setText:[score stringValue]];
        [lblWinner setHidden:false];
        NSString* winnerString = @"Player ";
        winnerString = [winnerString stringByAppendingString:winner];
        winnerString = [winnerString stringByAppendingString:@" wins"];
        [lblWinner setText:winnerString];
        
        //show winner for 1 sec
        [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
        sleep(1);
        
        //new round or play again
        if (round <= 10) {
            [self play];
        } else {
            [btnPlayAgain setHidden:false];
        }
    }
}

- (IBAction)p1Clicked:(id)sender {
    if ([currController roundRunning]) {
        [self win:@"1" label:lblScoreP1];
    }
}

- (IBAction)p2clicked:(id)sender {
    if ([currController roundRunning]) {
        [self win:@"2" label:lblScoreP2];
    }
}

- (IBAction)p3clicked:(id)sender {
    if ([currController roundRunning]) {
        [self win:@"3" label:lblScoreP3];
    }
}

- (IBAction)p4clicked:(id)sender {
    if ([currController roundRunning]) {
        [self win:@"4" label:lblScoreP4];
    }
}
@end
