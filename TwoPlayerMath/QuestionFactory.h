//
//  QuestionFactory.h
//  Maths
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Question.h"
@interface QuestionFactory : NSObject

@property (nonatomic,strong)NSArray *questionSubclassNames;

//generates a random question by selecting a subclass name from the above array
- (Question *)generateRandomQuestion;

@end
