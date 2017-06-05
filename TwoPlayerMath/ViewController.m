//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@property (nonatomic)NSInteger playerAnswer;
@property (nonatomic,strong)NSMutableArray *input;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameModel = [[GameModel alloc] init];
    
    _input = [[NSMutableArray alloc] init];
    
    _scoreLabels = [[NSMutableArray alloc] init];
    //dynamically create the required # of player score labels
    for (unsigned i = 0; i < NUMBEROFPLAYERS; i++) {
        //create a CGrect to form initial bounds on the label
        CGRect initial = CGRectMake(BASELABELX, BASELABELY + i*LABELHEIGHT, 0, LABELHEIGHT);
        UILabel *label = [[UILabel alloc] initWithFrame:initial];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:label];

        [label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:100];
        
        label.textAlignment = NSTextAlignmentRight;
        [label setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
        label.text = @"test string lol";
        [label sizeToFit];
        [_scoreLabels addObject:label];
    }
    
    [self gamePlay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gamePlay;
{
    //self.playerOneScore.text = [self.gameModel playerScore:0];
    //self.playerTwoScore.text = [self.gameModel playerScore:1];
    for (unsigned i = 0; i < NUMBEROFPLAYERS; i++) {
        NSString *scoreString = [self.gameModel playerScore:i];
        [self.scoreLabels objectAtIndex:i].text = scoreString;
        [[self.scoreLabels objectAtIndex:i] sizeToFit];
    }
    
    [self.gameModel randomQuestion];
    self.currentQuestion.text = self.gameModel.question;
    //self.currentQuestion.textAlignment = NSTextAlignmentCenter;
    [self.currentQuestion sizeToFit];
}

- (void)answerFromInput;
{
    NSString *answer = [self.input componentsJoinedByString:@""];
    self.playerAnswer = [answer integerValue];
    NSLog(@"answered with: %ld",self.playerAnswer);
}

- (IBAction)buttonOne:(id)sender {
    [self.input addObject:@"1"];
}

- (IBAction)buttonTwo:(id)sender {
    [self.input addObject:@"2"];
}

- (IBAction)buttonThree:(id)sender {
    [self.input addObject:@"3"];
}

- (IBAction)buttonFour:(id)sender {
    [self.input addObject:@"4"];
}

- (IBAction)buttonFive:(id)sender {
    [self.input addObject:@"5"];
}

- (IBAction)buttonSix:(id)sender {
    [self.input addObject:@"6"];
}

- (IBAction)buttonSeven:(id)sender {
    [self.input addObject:@"7"];
}

- (IBAction)buttonEight:(id)sender {
    [self.input addObject:@"8"];
}

- (IBAction)buttonNine:(id)sender {
    [self.input addObject:@"9"];
}

- (IBAction)buttonZero:(id)sender {
    [self.input addObject:@"0"];
}

- (IBAction)submitAnswer:(id)sender {
    [self answerFromInput];
    
    BOOL isCorrect = [self.gameModel checkAnswer:self.playerAnswer];
    
    if (isCorrect) {
        NSLog(@"Correct!");
    } else {
        [self.gameModel subtractLife];
        NSLog(@"Wrong!");
    }
    [self.input removeAllObjects];
    [self.gameModel nextUp];
    [self gamePlay];
}

@end
