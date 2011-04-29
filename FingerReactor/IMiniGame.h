//
//  IMiniGame.h
//  FingerReactor
//
//  Created by Patrizia Heer on 29.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IMiniGame <NSObject>

@required

    -(void) print;

    @property (nonatomic) Boolean *roundRunning;

@end
