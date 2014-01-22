//
//  FilmShowCell.h
//  filmcrowdfunding
//
//  Created by SHJJ on 13-11-27.
//  Copyright (c) 2013年 SHJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cellDelegate <NSObject>

@optional
-(void)changeCellFrame:(id)sender;

@end

@interface FilmShowCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) IBOutlet UIView *functionView;
@property (nonatomic, assign) id<cellDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIImageView *filmShowImageView;
@property (strong, nonatomic) IBOutlet UIButton *showFunctionButton;
@property (nonatomic, assign) BOOL isShowFunction;

- (IBAction)showFunctionAction:(id)sender;

@end
