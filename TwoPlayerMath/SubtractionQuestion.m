//
//  SubtractionQuestion.m
//  Maths
//
//  Created by Alex Lee on 2017-05-31.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "SubtractionQuestion.h"

@implementation SubtractionQuestion

- (instancetype) init {
    if (self = [super init]) {
        [self generateQuestion];
    }
    return self;
}

- (void)generateQuestion;
{
    super.answer = super.leftValue - super.rightValue;
    super.question = [NSString stringWithFormat:@"%tu - %tu ?",super.leftValue,super.rightValue];
}

@end
