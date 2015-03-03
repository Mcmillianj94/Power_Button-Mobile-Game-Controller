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
    NSLog(@"Stage %i", self.currentStage);
    self.isactive = false;
    self.currentStage = 0;
    self.powerButton.fillColor = self.powerButtonStageColors[0];
}

-(void)updateStage{
    if (self.isactive == true) {
        if (self.currentStage < self.numberOfStages) {
            if (self.currentStage > 0) {
                self.powerButton.fillColor = self.powerButtonStageColors[self.currentStage];
            }
            self.currentStage++;
            NSLog(@"%i", self.currentStage);
        }
    }
}
@end
