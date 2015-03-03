//
//  GameScene.m
//  PowerButtonIOS
//
//  Created by Joshua on 2/28/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "GameScene.h"
@interface GameScene()
@property PowerButton* powerButton;
@property (nonatomic) NSTimeInterval lastStageChange;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    NSArray* stageColors = [[NSArray alloc] initWithObjects:[UIColor whiteColor],[UIColor blueColor],[UIColor redColor],
                            [UIColor greenColor],[UIColor blackColor], nil];
    
    self.powerButton = [[PowerButton alloc] initWithRadius:20.0f numberOfStages:5 stageColors:stageColors];
    self.powerButton.position = CGPointMake(self.size.width/2, self.size.height/2);
    [self addChild: self.powerButton];
    
}

- (void)update:(NSTimeInterval)currentTime {
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 2) { // more than a second since last update
        timeSinceLast = 2.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastStageChange += timeSinceLast;
    if (self.lastStageChange > 1) {
        self.lastStageChange = 0;
        [self.powerButton updateStage];
    }
}


@end
