//
//  FilmShowCell.m
//  filmcrowdfunding
//
//  Created by SHJJ on 13-11-27.
//  Copyright (c) 2013年 SHJJ. All rights reserved.
//

#import "FilmShowCell.h"

@implementation FilmShowCell
@synthesize filmShowImageView;
@synthesize showFunctionButton;
@synthesize isShowFunction;
@synthesize functionView;
@synthesize delegate;
@synthesize textLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.isShowFunction = NO;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showFunctionAction:(id)sender {
    [self.delegate changeCellFrame:sender];
}

@end
