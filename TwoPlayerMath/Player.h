//
//  Player.h
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LIVES 3
@interface Player : NSObject

//lives remaining
@property (nonatomic)NSInteger life;

//player name
@property (nonatomic,strong)NSString *name;

//initialize the player instance with a name
- (id)initWithName:(NSString *)name;

//decrement life count
- (void)loseLife;

//return string describing the player's remaining lives
- (NSString *)getScore;

@end
