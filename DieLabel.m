//
//  DieLabel.m
//  Farkle
//
//  Created by Calvin Hildreth on 3/19/14.
//  Copyright (c) 2014 Calvin Hildreth. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

-(void)roll
{
    NSInteger randomNumber = (arc4random() % 6) + 1;
    self.text = [NSString stringWithFormat:@"%ld",(long)randomNumber];
}

-(IBAction)onLabelTapped:(UITapGestureRecognizer *)sender
{
    [self.delegate didChooseDie:self];
}

@end
