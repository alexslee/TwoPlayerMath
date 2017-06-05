//
//  GameModel.m
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "GameModel.h"

@interface GameModel ()

@property (nonatomic)NSInteger currentPlayerIndex;
@property (nonatomic)NSInteger answer;
@property (nonatomic)Player *lost;
@property (nonatomic)BOOL isGameOver;

@end

@implementation GameModel

- (instancetype)init {
    if (self == [super init]) {
        _players = [[NSMutableArray alloc] init];
        
        for (unsigned i = 0; i < NUMBEROFPLAYERS; i++) {
            NSString *name = [NSString stringWithFormat:@"Player %tu",i+1];
            [_players addObject:[[Player alloc] initWithName:name]];
        }
        
        _question = [[NSString alloc] init];
        
        _currentPlayer = [[Player alloc] init];
        
        _currentPlayerIndex = 0;
        
        _lost = [[Player alloc] init];
        
        _isGameOver = NO;
    }
    return self;
}

- (void)randomQuestion;
{
    NSInteger left = arc4random_uniform(20) + 1;
    NSInteger right = arc4random_uniform(20) + 1;
    NSString *playerName = [self getCurrentPlayer].name;
    
    self.question = [NSString stringWithFormat:@"%@: %ld + %ld?",playerName,left,right];
    self.answer = left + right;
    
    //NSLog(@"%@ || Answer is: %ld",self.question,self.answer);
    
    return;
}

- (Player *)getCurrentPlayer;
{
    return [ self.players objectAtIndex:(self.currentPlayerIndex % [self.players count]) ];
}

- (NSString *)playerScore:(NSInteger)index;
{
    Player *player = [self.players objectAtIndex:index];
    return [player getScore];
}

- (BOOL)checkAnswer:(NSInteger)playerAnswer;
{
    return (playerAnswer == self.answer);
}

- (void)subtractLife;
{
    [[self getCurrentPlayer] loseLife];
    if ([self getCurrentPlayer].life == 0) {
        self.lost = [self getCurrentPlayer];
        self.isGameOver = YES;
    }
    return;
}

- (void)nextUp;
{
    self.currentPlayerIndex++;
}

- (BOOL)gameOver;
{
    return self.isGameOver;
}

- (NSString *)whoLost;
{
    if (self.isGameOver) {
        return self.lost.name;
    } else {
        return nil;
    }
}

@end
