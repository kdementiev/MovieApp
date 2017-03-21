//
//  PopularMoviesViewController.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "PopularMoviesViewController.h"

//
#import <AFNetworking/UIKit+AFNetworking.h>


#import "LocalizationStrings.h"

// Custom views.
#import "MovieTableViewCell.h"

// DTO
#import "MovieInfo.h"




@interface PopularMoviesViewController ()

@property (weak, nonatomic) IBOutlet UIRefreshControl *contentRefreshControl;

@property (nonatomic) NSArray<MovieInfo *> *moviesList;

@end


@implementation PopularMoviesViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Notify on fist launch.
    [self MA_notifyWithUserWantsLatestContent];
}

#pragma mark - Interface Actions -

- (IBAction)onRefreshAction:(id)sender {
    // Notify with user input.
    [self MA_notifyWithUserWantsLatestContent];
}

#pragma mark - Presentation controls -

- (void)presentMovies:(NSArray<MovieInfo *> *)moviesList {
    // TODO: Reload table.
    _moviesList = moviesList;
    
    [self.tableView reloadData];
    [self.contentRefreshControl endRefreshing];
}

- (void)showOfflineCaption:(BOOL)show {
    self.navigationItem.prompt = show ? NSLocalizedString(NoInternetConnectionStringKey, nil) : nil;
}

#pragma mark - Output Helpers -

- (void)MA_notifyWithUserWantsLatestContent {
    [self.delegate userWantsLatestContent];
}

- (void)MA_notifyWithUserWantsDetailedInformationForItem:(NSUInteger)index {
    [self.delegate userWantsDetailedInformationForItem:index];
}

#pragma mark - TableView Delegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self MA_notifyWithUserWantsDetailedInformationForItem:indexPath.row];
}

#pragma mark - TableView Data Source -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moviesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Prepare cell.
    MovieTableViewCell *movieCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MovieTableViewCell class])];
    MovieInfo *movieInfo = [_moviesList objectAtIndex:indexPath.row];
    
    [self MA_prepareCell:movieCell withMoviewInfo:movieInfo];
    
    return movieCell;
}

- (void)MA_prepareCell:(MovieTableViewCell *)cell withMoviewInfo:(MovieInfo *)movieInfo {
    
    cell.titleLabel.text = movieInfo.title;
    cell.originalTitleLabel.text = movieInfo.originalTitle;
    cell.overviewLabel.text = movieInfo.overview;
    
    [cell setRate:movieInfo.rate];
    
    [cell.backgroundImageView setImageWithURL: movieInfo.backgroundURL];
}

@end








