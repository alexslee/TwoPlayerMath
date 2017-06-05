//
//  ViewController.h
//  TwoPlayerMath
//
//  Created by Alex Lee on 2017-06-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
#define BASELABELX 230
#define BASELABELY 42
#define LABELHEIGHT 21
#define INITLABELWIDTH 42

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentQuestion;

@property (strong,nonatomic)NSMutableArray<UILabel *> *scoreLabels;


@property (nonatomic,strong)GameModel *gameModel;


@end

