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
    [self _notifyWithUserWantsLatestContent];
    
//    [self.contentRefreshControl beginRefreshing];
}

#pragma mark - Interface Actions -

- (IBAction)onRefreshAction:(id)sender {
    // Notify with user input.
    [self _notifyWithUserWantsLatestContent];
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

- (void)_notifyWithUserWantsLatestContent {
    [self.delegate userWantsLatestContent];
}

- (void)_notifyWithUserWantsDetailedInformationForItem:(NSUInteger)index {
    [self.delegate userWantsDetailedInformationForItem:index];
}

#pragma mark - TableView Delegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self _notifyWithUserWantsDetailedInformationForItem:indexPath.row];
}

#pragma mark - TableView Data Source -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moviesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Prepare cell.
    MovieTableViewCell *movieCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MovieTableViewCell class])];
    
    MovieInfo *movieInfo = [_moviesList objectAtIndex:indexPath.row];
    
    movieCell.titleLabel.text = movieInfo.title;
    movieCell.originalTitleLabel.text = movieInfo.originalTitle;
    movieCell.overviewLabel.text = movieInfo.overview;
    
    [movieCell setRate:movieInfo.rate];
    
    [movieCell.backgroundImageView setImageWithURL: movieInfo.backgroundURL];
    
    return movieCell;
}

@end








