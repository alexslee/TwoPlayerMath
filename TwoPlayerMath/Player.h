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

@property (nonatomic)NSInteger life;
@property (nonatomic,strong)NSString *name;

- (id)initWithName:(NSString *)name;
- (void)loseLife;

- (NSString *)getScore;

@end
