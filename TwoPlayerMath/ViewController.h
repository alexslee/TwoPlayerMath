//
//  ViewController.h
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentQuestion;

@property (nonatomic,strong)GameModel *gameModel;


@end

