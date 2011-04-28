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
}


- (IBAction)startClicked:(id)sender {
    PlaygroundViewController *playgroundViewController = [[PlaygroundViewController alloc] initWithNibName:@"PlaygroundViewIPhone" bundle:nil];
    

    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:playgroundViewController]
     autorelease];
    
    [nav setNavigationBarHidden:true];
    
    //playgroundViewController.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelDetails)] autorelease];
    
    [self presentModalViewController:nav animated:YES];
    
}
@end
