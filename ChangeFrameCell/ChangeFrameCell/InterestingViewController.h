//
//  InterestingViewController.h
//  filmcrowdfunding
//
//  Created by SHJJ on 13-10-9.
//  Copyright (c) 2013年 SHJJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmShowCell.h"

@interface InterestingViewController : UIViewController<cellDelegate>
{
    NSInteger selectedRow;
}

@property (strong, nonatomic) IBOutlet UITableView *interestingFilmTableView;

@end
