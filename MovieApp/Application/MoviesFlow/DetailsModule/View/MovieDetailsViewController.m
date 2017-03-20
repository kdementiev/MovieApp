//
//  MovieDetailsViewController.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieDetailsViewController.h"

#import "MovieInfo.h"
#import <AFNetworking/UIImageView+AFNetworking.h>


@interface MovieDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;

@end

@implementation MovieDetailsViewController

@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.delegate userWantsToSeeDetails];
}


- (void)presentMovieContent:(MovieInfo *)movie {
    
    self.navigationItem.title = movie.title;
    _titleLabel.text = movie.originalTitle;
    _releaseDateLabel.text = movie.releaseDate;
    _genreLabel.text = [self _formattedListStringFromStringsArray:movie.genres];
    _overviewLabel.text = movie.overview;
    
    [_backgroundImageView setImageWithURL:movie.posterURL];
}

- (NSString *)_formattedListStringFromStringsArray:(NSArray<NSString*> *)strings {
    __block NSString *formattedGeners = @"";
    
    [strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != 0) {
            formattedGeners = [formattedGeners stringByAppendingString:@", "];
        }
        
        formattedGeners = [formattedGeners stringByAppendingString:obj];
    }];
    
    return formattedGeners;
}


@end
