//
//  DieLabel.h
//  Farkle
//
//  Created by Calvin Hildreth on 3/19/14.
//  Copyright (c) 2014 Calvin Hildreth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DieLabelDelegate.h"

@interface DieLabel : UILabel

@property id<DieLabelDelegate> delegate;
@property BOOL dieSelected;
@property BOOL dieKept;

-(void)roll;

@end
