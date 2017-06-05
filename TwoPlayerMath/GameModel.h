//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#define NUMBEROFPLAYERS 2

@interface GameModel : NSObject

@property (nonatomic,strong)NSMutableArray *players;

@property (nonatomic,strong)NSString *question;

@property (nonatomic,strong)Player *currentPlayer;

- (void)randomQuestion;

- (NSString *)playerScore:(NSInteger)index;

- (BOOL)checkAnswer:(NSInteger)playerAnswer;

- (void)subtractLife;

- (void)nextUp;

@end
