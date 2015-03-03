//
//  PowerButton.m
//  PowerButtonIOS
//
//  Created by Joshua on 2/28/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "PowerButton.h"
@interface PowerButton()
@property float powerButtonRadius;
@property int numberOfStages;
@property NSArray* powerButtonStageColors;
@property int currentStage;

@property SKShapeNode* powerButton;
@end

@implementation PowerButton
-(id)initWithRadius: (float)pbRadius numberOfStages: (int)pbStages stageColors: (NSArray*)stageColors
{
    if (self = [super init]) {
        self.powerButtonRadius = pbRadius;
        self.numberOfStages = pbStages;
        self.powerButtonStageColors = stageColors;
        self.isactive = false;
        self.currentStage = 1;
        
        self.powerButton = [SKShapeNode shapeNodeWithCircleOfRadius:self.powerButtonRadius];
        self.powerButton.position = CGPointMake(self.size.width/2, self.size.height/2);
        self.powerButton.fillColor = stageColors[0];
        self.powerButton.lineWidth = 0;
        [self addChild:self.powerButton];
        
        [self setUserInteractionEnabled:true];
    }
    return self;
};

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    self.isactive = true;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    //Call the Start actions method to preform an action based on the current stage
    [self startActionForStage:self.currentStage];
    [self resetButton];
}

//resets the button data when touches end.
-(void)resetButton{
    self.isactive = false;
    self.currentStage = 1;
    self.powerButton.fillColor = self.powerButtonStageColors[0];
}

/*
 Called With-In the update function in the GameScene Class
 This method changes the currentStage only if the button is being
 held. also changes the powerButton Color.
*/
-(void)updateStage{
    if (self.isactive == true) {
        if (self.currentStage < self.numberOfStages) {
            self.powerButton.fillColor = self.powerButtonStageColors[self.currentStage];
            self.currentStage++;
        }
    }
}

/*
 This is the method called that houses all the actions
 When the currentStage number is passed in it performs
 the action related to the currentStage.
*/
-(void)startActionForStage: (int)stage{
    int cStage = stage;
    
    switch (cStage) {
        case 1:
            NSLog(@"Stage one action");
            break;
        case 2:
            NSLog(@"Stage Two action");
            break;
        case 3:
            NSLog(@"Stage Three action");
            break;
        case 4:
            NSLog(@"Stage Four action");
            break;
        case 5:
            NSLog(@"Stage Five action");
            break;
        default:
            break;
    }
}
@end
