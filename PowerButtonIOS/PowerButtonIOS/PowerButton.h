//
//  PowerButton.h
//  PowerButtonIOS
//
//  Created by Joshua on 2/28/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface PowerButton : SKSpriteNode
-(id)initWithRadius: (float)pbRadius numberOfStages: (int)pbStages stageColors: (NSArray*)stageColors;
-(void)updateStage;
@property BOOL isactive;
@end
