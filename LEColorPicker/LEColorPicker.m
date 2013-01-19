//
//  LEColorPicker.m
//  LEColorPicker
//
//  Created by Luis Enrique Espinoza Severino on 10-12-12.
//  Copyright (c) 2012 LuisEspinoza. All rights reserved.
//

#import "LEColorPicker.h"

#define LECOLORPICKER_CONCRETE                  @"LEColorPickerSethThompson"

@implementation LEColorPicker

+ (LEColorPicker*)colorPicker
{
    return [[NSClassFromString(LECOLORPICKER_CONCRETE) alloc] init];
}

-   (void)pickColorsFromImage:(UIImage *)image
                   onComplete:(void (^)(NSDictionary *colorsPickedDictionary))completeBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDate *startDate = [NSDate date];
        NSDictionary *colorsPickedDictionary = [self dictionaryWithColorsPickedFromImage:image];
        NSDate *endDate = [NSDate date];
        NSTimeInterval timeDifference = [endDate timeIntervalSinceDate:startDate];
        double timePassed_ms = timeDifference * -1000.0;
        NSLog(@"Computation time: %f", timePassed_ms);
        dispatch_async(dispatch_get_main_queue(), ^{
            completeBlock(colorsPickedDictionary);
        });
    });
}

- (NSDictionary *)dictionaryWithColorsPickedFromImage:(UIImage *)image
{
    
    //Subclasses must implement this method
    return nil;
}

@end
