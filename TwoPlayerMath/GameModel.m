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

@end

@implementation GameModel

- (instancetype)init {
    if (self == [super init]) {
        _players = [[NSMutableArray alloc] init];
        
        for (unsigned i = 0; i < NUMBEROFPLAYERS; i++) {
            NSString *name = [NSString stringWithFormat:@"Player %tu",i+1];
            [_players addObject:[[Player alloc] initWithName:name]];
        }
        
        _currentPlayerIndex = 0;
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

@end
