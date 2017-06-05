//
//  Question.h
//  Maths
//
//  Created by Alex Lee on 2017-05-30.
//  Copyright © 2017 Alex Lee. All rights reserved.
//
#import <Foundation/Foundation.h>
#ifndef Question_h
#define Question_h

@interface Question : NSObject

/*****PROPERTIES*****/
@property (nonatomic, strong)NSString *question;

@property (nonatomic)NSInteger answer;

@property (nonatomic, strong)NSDate *startTime;

@property (nonatomic, strong)NSDate *endTime;

@property (nonatomic)NSInteger rightValue;

@property (nonatomic)NSInteger leftValue;

/*****METHODS*****/
- (void)generateQuestion;

- (void)printQuestion;

- (BOOL)checkAnswer:(NSInteger)userAns;

- (NSTimeInterval)answerTime;

@end

#endif /* Question_h */
