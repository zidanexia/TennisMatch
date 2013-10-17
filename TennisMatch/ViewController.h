//
//  ViewController.h
//  TennisMatch
//
//  Created by user on 13-10-16.
//  Copyright (c) 2013年 Lingli Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Round;
@property (weak, nonatomic) IBOutlet UILabel *ScoreAllA;
@property (weak, nonatomic) IBOutlet UILabel *ScoreAllB;
@property (weak, nonatomic) IBOutlet UILabel *Message;

@property (copy,nonatomic) NSString *ScoreA;
@property (copy,nonatomic) NSString *ScoreB;
@property (copy,nonatomic) NSString *ScoreMessage;

@property (weak, nonatomic) IBOutlet UIButton *PlayerAButton;
@property (weak, nonatomic) IBOutlet UIButton *PlayerBButton;
@property (weak, nonatomic) IBOutlet UIButton *Continue;

@property (copy,nonatomic)NSNumber *ScoreA0;
@property (copy,nonatomic)NSNumber *ScoreB0;




- (IBAction)PlayerA:(id)sender;
- (IBAction)PlayerB:(id)sender;
- (IBAction)Continue0:(id)sender;









- (IBAction)Clean:(id)sender;


@end
