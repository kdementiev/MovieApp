//
//  NetworkingStatusService.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define networkingStatusService [NetworkingStatusService sharedInstance]

typedef void(^NetworkingStatusServiceCallback)();

@interface NetworkingStatusService : NSObject

+ (instancetype)sharedInstance;

/**
    Allows subscriber to be notified with evenet when it need to reload data from network etc.
    If subscriber dies, 'callback' block will be removed automatically.
 */
- (void)subscribeForRefreshNetworkStat:(id)subscriber event:(NetworkingStatusServiceCallback)callback;

@end
