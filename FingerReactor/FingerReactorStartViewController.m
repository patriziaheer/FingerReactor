//
//  FingerReactorStartViewController.m
//  FingerReactor
//
//  Created by Patrizia Heer on 28.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FingerReactorStartViewController.h"
#import "PlaygroundViewController.h"


@implementation FingerReactorStartViewController

-(void) viewDidLoad {
    [[btnStart layer] setCornerRadius:8.0f];
    [[btnStart layer] setMasksToBounds:YES];
    [[btnStart layer] setBorderWidth:1.0f];
}


- (IBAction)startClicked:(id)sender {
    NSString *deviceType = [UIDevice currentDevice].model;

    NSLog(deviceType);
    
    PlaygroundViewController *playgroundViewController;
    //if ([deviceType rangeOfString:@"iPhone"].location != NSNotFound) {
    if ([deviceType rangeOfString:@"iPad"].location != NSNotFound) {
        playgroundViewController = [[PlaygroundViewController alloc] initWithNibName:@"PlaygroundViewIPad" bundle:nil];
    } else { //IPhone or IPod Touch
        playgroundViewController = [[PlaygroundViewController alloc] initWithNibName:@"PlaygroundViewIPhone" bundle:nil];
    }
    

    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:playgroundViewController]
     autorelease];
    
    [nav setNavigationBarHidden:true];
    
    
    [self presentModalViewController:nav animated:YES];
    
}
- (void)dealloc {
    [btnStart release];
    [super dealloc];
}
- (void)viewDidUnload {
    [btnStart release];
    btnStart = nil;
    [super viewDidUnload];
}
@end
