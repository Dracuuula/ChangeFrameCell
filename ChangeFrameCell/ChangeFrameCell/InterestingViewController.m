//
//  InterestingViewController.m
//  filmcrowdfunding
//
//  Created by SHJJ on 13-10-9.
//  Copyright (c) 2013年 SHJJ. All rights reserved.
//

#import "InterestingViewController.h"

@interface InterestingViewController ()

@property (nonatomic, strong)NSMutableArray * tempMovieArray;
@property (nonatomic, strong)NSMutableArray * tempMovieNameArray;

@end

@implementation InterestingViewController
@synthesize interestingFilmTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        selectedRow = -1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setInterestingFilmTableView:nil];
    [super viewDidUnload];
}

#pragma mark - table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == selectedRow) {
        return 180;
    }else{
        return 136;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 10)];
    return view;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellReuseStr = @"cellReuseStr";
    
    FilmShowCell * cell = (FilmShowCell *)[tableView dequeueReusableCellWithIdentifier:cellReuseStr];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FilmShowCell" owner:self options:nil] lastObject];
        
        cell.delegate = self;
    }
    
    if (indexPath.row == selectedRow) {
        [cell.textLabel setFrame:CGRectMake(20, 20, 180, 80)];
        cell.showFunctionButton.selected = YES;
        cell.functionView.hidden = NO;
    }else{
        [cell.textLabel setFrame:CGRectMake(20, 20, 180, 40)];
        cell.showFunctionButton.selected = NO;
        cell.functionView.hidden = YES;
        
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    if (selectedRow != -1) {
        NSIndexPath  * indexPath_1=[NSIndexPath indexPathForRow:selectedRow inSection:0];
        NSArray * indexArray=[NSArray  arrayWithObject:indexPath_1];
        
        selectedRow = -1;
        
        [self.interestingFilmTableView  reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];   
    }
}

#pragma mark - cell delegate
-(void)changeCellFrame:(id)sender
{
    if (selectedRow == -1) {
        FilmShowCell *cell;
        float version = [[[UIDevice currentDevice] systemVersion] floatValue];
        if (version<7.0) {
            cell = (FilmShowCell *)[[sender superview] superview];
        }else{
            cell = (FilmShowCell *)[[[sender superview] superview]superview];
        }

        NSIndexPath *indexPath = [self.interestingFilmTableView indexPathForCell:cell];
        
        selectedRow = indexPath.row;
        NSArray * indexArray = [NSArray arrayWithObject:indexPath];
        
        [self.interestingFilmTableView  reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [self.interestingFilmTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    }else{
        NSIndexPath  * indexPath_1=[NSIndexPath indexPathForRow:selectedRow inSection:0];
        NSArray * indexArray=[NSArray  arrayWithObject:indexPath_1];
        
        selectedRow = -1;
        
        [self.interestingFilmTableView  reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
