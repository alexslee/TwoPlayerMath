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
@property (nonatomic,strong)Player *lost;
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
        
        _question = [[NSMutableString alloc] init];
        
        _currentPlayer = [[Player alloc] init];
        
        _currentPlayerIndex = 0;
        
        _lost = [[Player alloc] init];
        
        _isGameOver = NO;
        
        _questionFactory = [[QuestionFactory alloc] init];
    }
    return self;
}

- (void)restart;
{
    for (Player *player in self.players) {
        player.life = 3;
    }
    self.currentPlayerIndex = 0;
    self.currentPlayer = [self.players objectAtIndex:self.currentPlayerIndex];
    _lost = nil;
    _isGameOver = NO;
}

- (void)randomQuestion;
{
    NSString *playerName = [self getCurrentPlayer].name;
    
    //use the question factory to randomly create a question, then add it to the question string for display to the player
    Question *generated = [self.questionFactory generateRandomQuestion];

    self.question = [NSMutableString stringWithFormat:@"%@: ",playerName];
    [self.question appendString:generated.question];
    self.answer = generated.answer;
    
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
