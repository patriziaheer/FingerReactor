//
//  FingerReactorViewController.h
//  FingerReactor
//
//  Created by Patrizia Heer on 28.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaygroundViewController : UIViewController {
    
    IBOutlet UIView *playgroundView;
    IBOutlet UIButton *btnStart;
    IBOutlet UILabel *lblWinner;
    IBOutlet UIButton *btnP1;
    IBOutlet UIButton *btnP2;
    IBOutlet UIButton *btnP3;
    IBOutlet UIButton *btnP4;
    IBOutlet UILabel *lblScoreP1;
    IBOutlet UILabel *lblScoreP2;
    IBOutlet UILabel *lblScoreP3;
    IBOutlet UILabel *lblScoreP4;
    
    Boolean *hasWinnter;
}
- (IBAction)startClicked:(id)sender;
- (IBAction)p1Clicked:(id)sender;
- (IBAction)p2clicked:(id)sender;
- (IBAction)p3clicked:(id)sender;
- (IBAction)p4clicked:(id)sender;

@property (nonatomic) Boolean *hasWinner;

@end
