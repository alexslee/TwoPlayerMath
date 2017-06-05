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
@property (nonatomic)BOOL play;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _gameModel = [[GameModel alloc] init];
    
    _input = [[NSMutableArray alloc] init];
    
    _play = YES;
    
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
    if (!self.play) {
        return;
    }
    //update the score labels
    for (unsigned i = 0; i < NUMBEROFPLAYERS; i++) {
        NSString *scoreString = [self.gameModel playerScore:i];
        [self.scoreLabels objectAtIndex:i].text = scoreString;
        [[self.scoreLabels objectAtIndex:i] sizeToFit];
    }
    //if game over, just display the game over text
    if ([self.gameModel gameOver]) {
        self.currentQuestion.text = [NSString stringWithFormat:@"Game Over! %@ lost!",[self.gameModel whoLost]];
        [self.currentQuestion sizeToFit];
        self.play = NO;
        return;
    }
    //generate the next question and display it
    [self.gameModel randomQuestion];
    
    self.currentQuestion.text = self.gameModel.question;
    [self.currentQuestion sizeToFit];
    
    return;
}

- (void)answerFromInput;
{
    NSString *answer = [self.input componentsJoinedByString:@""];
    self.playerAnswer = [answer integerValue];
    NSLog(@"answered with: %ld",self.playerAnswer);
}

//the following methods for the # buttons just construct the array of string literals from which we will extract the answer

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

//answer checking when the submit answer button is pressed

- (IBAction)submitAnswer:(id)sender {
    if (self.play) {
        [self answerFromInput];
        
        BOOL isCorrect = [self.gameModel checkAnswer:self.playerAnswer];
        
        if (isCorrect) {
            NSLog(@"Correct!");
        } else {
            [self.gameModel subtractLife];
            NSLog(@"Wrong!");
        }
        
        //reset input array, swap to the next player, and run the gamePlay function again
        [self.input removeAllObjects];
        [self.gameModel nextUp];
        [self gamePlay];
        
        [self answerLabelShift:isCorrect];
    }
}

- (void)answerLabelShift:(BOOL)wasRight;
{
    self.correctness.alpha = 1.0;
    if (wasRight) {
        self.correctness.text = @"You got it!";
        self.correctness.backgroundColor = [UIColor greenColor];
        [self.correctness sizeToFit];
    } else {
        self.correctness.text = @"Wrong!!";
        self.correctness.backgroundColor = [UIColor redColor];
        [self.correctness sizeToFit];
        
    }
    [UIView animateWithDuration:1.0 animations:^{self.correctness.alpha = 0.0;} completion:^(BOOL finished){;}];
}

@end
