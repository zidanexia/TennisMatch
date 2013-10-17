//
//  ViewController.m
//  TennisMatch
//
//  Created by user on 13-10-16.
//  Copyright (c) 2013年 Lingli Peng. All rights reserved.
//


// 这里只做一局比赛，全场待之后开发继续

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int playA=0;
int playB=0;

int ScoreA1=0;
int ScoreB1=0;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.ScoreA=@"Love";
    self.ScoreB=@"Love";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PlayerA:(id)sender {
    playA+=1;
    switch (playA) {
        case 0:
            self.ScoreA=@"Love";
            break;
        case 1:
            self.ScoreA=@"Fifteen";
            break;
        case 2:
            self.ScoreA=@"Thirty";
            break;
        case 3:
            self.ScoreA=@"Forty";
            break;
        default:
            break;
    }
    self.ScoreMessage=[NSString stringWithFormat:@"%@ %@",self.ScoreA,self.ScoreB];

    [self.Message setText:self.ScoreMessage];
    [self MessageMakeSure];
    
    
}

- (IBAction)PlayerB:(id)sender {
    playB+=1;
    switch (playB) {
        case 0:
            self.ScoreB=@"Love";
            break;
        case 1:
            self.ScoreB=@"Fifteen";
            break;
        case 2:
            self.ScoreB=@"Thirty";
            break;
        case 3:
            self.ScoreB=@"Forty";
            break;
        default:
            break;
    }
    self.ScoreMessage=[NSString stringWithFormat:@"%@ %@",self.ScoreA,self.ScoreB];
    
    [self.Message setText:self.ScoreMessage];
    [self MessageMakeSure];
}



- (IBAction)Clean:(id)sender {
    
    self.ScoreAllA.text=@"0";
    self.ScoreAllB.text=@"0";
    ScoreA1=0;
    ScoreB1=0;
    
    self.PlayerAButton.enabled=YES;
    [self.PlayerAButton setBackgroundColor:[UIColor greenColor]];
    [self.PlayerAButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.PlayerBButton.enabled=YES;
    [self.PlayerBButton setBackgroundColor:[UIColor greenColor]];
    [self.PlayerBButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.Continue.enabled=YES;
    self.Continue.hidden=YES;
    
    
    [self.Continue setHidden:YES];
    [self CleanVoid];
    playA=0;
    playB=0;
    
    switch (playA) {
        case 0:
            self.ScoreA=@"Love";
            break;
        case 1:
            self.ScoreA=@"Fifteen";
            break;
        case 2:
            self.ScoreA=@"Thirty";
            break;
        case 3:
            self.ScoreA=@"Forty";
            break;
        default:
            break;
    }
    
    switch (playB) {
        case 0:
            self.ScoreB=@"Love";
            break;
        case 1:
            self.ScoreB=@"Fifteen";
            break;
        case 2:
            self.ScoreB=@"Thirty";
            break;
        case 3:
            self.ScoreB=@"Forty";
            break;
        default:
            break;
    }
    
    self.ScoreMessage=[NSString stringWithFormat:@"%@ %@",self.ScoreA,self.ScoreB];
    self.Message.text=@"Love All";
}
- (void)CleanVoid{
   
    playA=0;
    playB=0;
    self.PlayerAButton.enabled=YES;
    [self.PlayerAButton setBackgroundColor:[UIColor greenColor]];
    [self.PlayerAButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.PlayerBButton.enabled=YES;
    [self.PlayerBButton setBackgroundColor:[UIColor greenColor]];
    [self.PlayerBButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}
-(void)CleanVoid2{
    playA=0;
    playB=0;
}


-(void)MessageMakeSure{
    if (playA>=3&&playB>=3) {
        if (playA==playB) {
            [self.Message setText:@"Deuce"];
        }
        else if(playA>playB){
            [self.Message setText:@"Advantage PlayA"];
        }else{
            [self.Message setText:@"Advantage PlayB"];
        }
    }
    if (playA>3||playB>3) {
        if (playA-playB>1) {
            [self.Message setText:@"Game PlayA"];
            [self CleanVoid2];
            
            
            //按钮机制
            self.PlayerAButton.enabled=NO;
            [self.PlayerAButton setBackgroundColor:[UIColor redColor]];
            [self.PlayerAButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.PlayerBButton.enabled=NO;
            [self.PlayerBButton setBackgroundColor:[UIColor redColor]];
            [self.PlayerBButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.Continue setHidden:NO];
            
            
            //得分机制
            ScoreA1+=1;
            self.ScoreA0=[NSNumber numberWithInt:ScoreA1];
            self.ScoreAllA.text=[NSString stringWithFormat:@"%@",self.ScoreA0];
            
            
            if ((ScoreA1==6 && ScoreA1-ScoreB1>1) ||ScoreA1==7) {
                [self.Message setText:@"PlayA Win the Game!"];
                self.Continue.enabled=NO;
            }
            
            
        }
        if (playB-playA>1) {
            [self.Message setText:@"Game PlayB"];
            [self CleanVoid2];
            self.PlayerAButton.enabled=NO;
            [self.PlayerAButton setBackgroundColor:[UIColor redColor]];
            [self.PlayerAButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.PlayerBButton.enabled=NO;
            [self.PlayerBButton setBackgroundColor:[UIColor redColor]];
            [self.PlayerBButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.Continue setHidden:NO];
            
            ScoreB1+=1;
            self.ScoreB0=[NSNumber numberWithInt:ScoreB1];
            self.ScoreAllB.text=[NSString stringWithFormat:@"%@",self.ScoreB0];
            if ((ScoreB1==6 && ScoreB1-ScoreA1>1)||ScoreB1==7) {
                [self.Message setText:@"PlayB Win the Game!"];
                self.Continue.enabled=NO;
            }
        }
    }
    
    
    
    
    
    
    
}


- (IBAction)Continue0:(id)sender {
    [self.Continue setHidden:YES];
    [self CleanVoid];
    playA=0;
    playB=0;
    
    switch (playA) {
        case 0:
            self.ScoreA=@"Love";
            break;
        case 1:
            self.ScoreA=@"Fifteen";
            break;
        case 2:
            self.ScoreA=@"Thirty";
            break;
        case 3:
            self.ScoreA=@"Forty";
            break;
        default:
            break;
    }
    
    switch (playB) {
        case 0:
            self.ScoreB=@"Love";
            break;
        case 1:
            self.ScoreB=@"Fifteen";
            break;
        case 2:
            self.ScoreB=@"Thirty";
            break;
        case 3:
            self.ScoreB=@"Forty";
            break;
        default:
            break;
    }

    self.ScoreMessage=[NSString stringWithFormat:@"%@ %@",self.ScoreA,self.ScoreB];
    self.Message.text=@"Love All";
}
@end
