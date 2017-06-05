//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Question.h"
#import "QuestionFactory.h"
#define NUMBEROFPLAYERS 2

@interface GameModel : NSObject

/*****PROPERTIES*****/

//stores all of the players
@property (nonatomic,strong)NSMutableArray<Player *> *players;

//stores the next question
@property (nonatomic,strong)NSMutableString *question;

//indicates which player is currently active (their turn)
@property (nonatomic,strong)Player *currentPlayer;

//Generates a random question ( + , - , * , or / ) for the game
@property (nonatomic,strong)QuestionFactory* questionFactory;

/*****METHODS*****/

//handle game restart (reset the applicable game model properties)
- (void)restart;

//generate the next question
- (void)randomQuestion;

//return the player's score
- (NSString *)playerScore:(NSInteger)index;

//check the player's answer
- (BOOL)checkAnswer:(NSInteger)playerAnswer;

//decrement the life count of the current player
- (void)subtractLife;

//shift to the next player
- (void)nextUp;

//check if game over
- (BOOL)gameOver;

//return string indicating the player that lost
- (NSString *)whoLost;

@end
