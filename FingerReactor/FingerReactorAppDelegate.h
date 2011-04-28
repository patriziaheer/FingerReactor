//
//  FingerReactorAppDelegate.h
//  FingerReactor
//
//  Created by Patrizia Heer on 28.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlaygroundViewController;

@interface FingerReactorAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PlaygroundViewController *viewController;

@end
