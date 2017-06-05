//
//  Player.m
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init {
    if (self == [super init]) {
        _life = LIVES;
        _name = [[NSString alloc] init];
    }
    return self;
}

- (id)initWithName:(NSString *)name;
{
    self = [super init];
    if (self) {
        _life = LIVES;
        _name = name;
    }
    return self;
}

- (void)loseLife;
{
    if (self.life > 0) {
        self.life--;
    }
}

@end
