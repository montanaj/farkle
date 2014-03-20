//
//  ViewController.m
//  Farkle
//
//  Created by Calvin Hildreth on 3/19/14.
//  Copyright (c) 2014 Calvin Hildreth. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>
{
    NSMutableArray *dice;
    NSArray *constantDice;
    NSMutableArray *threeOfaKind;
    BOOL playerTurn;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    for (DieLabel *dieLabel in self.view.subviews) {
        if ([dieLabel isKindOfClass:[DieLabel class]])
        {
            [dieLabel setDelegate:self];
        }
    }
    
    dice = [NSMutableArray new];
    constantDice = @[self.view.subviews[0],
                    self.view.subviews[1],
                    self.view.subviews[2],
                    self.view.subviews[3],
                    self.view.subviews[4],
                    self.view.subviews[5]];
}

- (IBAction)onRollButtonPressed:(id)sender
{
    int index = 0;
    
    for (DieLabel *dieLabel in self.view.subviews)
    {
        if ([dieLabel isKindOfClass:[DieLabel class]])
        {
            if (dieLabel.dieKept)
            {
                dieLabel.userInteractionEnabled = NO;
            }
            if (![dice containsObject:dieLabel]) {
                [dieLabel roll];

                if ([dieLabel.text isEqualToString:@"1"] || [dieLabel.text isEqualToString:@"5"])
                {
                    dieLabel.userInteractionEnabled = YES;
                }
            }
        }
    }
    
    for (DieLabel *label in constantDice)
    {
        for (DieLabel *die in dice)
        {
            if ([label.text isEqualToString:die.text])
            {
                [threeOfaKind addObject:die];
                ++index;
            }
        }
    
    }
}

-(void)didChooseDie:(DieLabel *)dieLabel
{
    if (!dieLabel.dieSelected && !dieLabel.dieKept)
    {
        [dice addObject:dieLabel];
        dieLabel.backgroundColor = [UIColor whiteColor];
        dieLabel.textColor = [UIColor blackColor];
        [self resetDice];
    }
    else
    {
        [dice removeObject:dieLabel];
        dieLabel.backgroundColor = [UIColor blackColor];
        dieLabel.textColor = [UIColor whiteColor];
    }
    dieLabel.dieSelected = !dieLabel.dieSelected;
    dieLabel.dieKept = !dieLabel.dieKept;
}

-(void)resetDice
{
    if (dice.count == 6) {
        [dice removeAllObjects];
        for (DieLabel *dieLabel in self.view.subviews)
        {
            if ([dieLabel isKindOfClass:[DieLabel class]])
            {
                dieLabel.backgroundColor = [UIColor blackColor];
                dieLabel.textColor = [UIColor whiteColor];
                dieLabel.userInteractionEnabled = NO;
            }
        }
    }
}











@end
