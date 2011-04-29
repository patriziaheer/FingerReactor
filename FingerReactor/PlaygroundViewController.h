//
//  FingerReactorViewController.h
//  FingerReactor
//
//  Created by Patrizia Heer on 28.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMiniGame.h"

@class HitWhenGreenViewController;

@interface PlaygroundViewController : UIViewController {
    
    IBOutlet UIButton *btnPlayAgain;
    IBOutlet UILabel *lblWinner;    
    IBOutlet UILabel *lblScoreP1;
    IBOutlet UILabel *lblScoreP2;
    IBOutlet UILabel *lblScoreP3;
    IBOutlet UILabel *lblScoreP4;
    IBOutlet UIButton *btnP1;
    IBOutlet UIButton *btnP2;
    IBOutlet UIButton *btnP3;
    IBOutlet UIButton *btnP4;
    
    Boolean *hasWinner;
    int round;
    HitWhenGreenViewController *hitWhenGreenViewController;
    id <IMiniGame> *currController;
}
- (IBAction)playAgainClicked:(id)sender;
- (IBAction)p1Clicked:(id)sender;
- (IBAction)p2clicked:(id)sender;
- (IBAction)p3clicked:(id)sender;
- (IBAction)p4clicked:(id)sender;

@property (nonatomic) Boolean *hasWinner;

@end
