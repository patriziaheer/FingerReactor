//
//  HitWhenGreenViewController.h
//  FingerReactor
//
//  Created by Patrizia Heer on 29.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMiniGame.h"

@interface HitWhenGreenViewController : UIViewController <IMiniGame> {
    
    IBOutlet UIView *playgroundView;
    Boolean *roundRunning;
}


@end
