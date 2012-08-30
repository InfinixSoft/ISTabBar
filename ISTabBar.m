//
//  ISTabBar.m
//
//  Created on 01/08/12.
//  Copyright (c) 2012 InfinixSoft. All rights reserved.
//

#import "ISTabBar.h"

@implementation ISTabBar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    /* Loading Settings from Plist file */
    NSDictionary * plist = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ISTabBarSettings" ofType:@"plist"]];
    NSDictionary * images = [plist objectForKey:@"image_names"];
    NSDictionary * titleSettings = [plist objectForKey:@"title_labels_settings"];
    
    /* Setting Background Image */
    NSString * imgPathBackground = [[NSBundle mainBundle] pathForResource:[images objectForKey:@"background"] ofType:nil];
    UIImage * imgBackground = [[UIImage alloc] initWithContentsOfFile:imgPathBackground];
    UIImageView * imgView = [[UIImageView alloc] initWithImage:imgBackground];
    [self insertSubview:imgView atIndex:0];
    [imgView release];
    [imgBackground release];
    
    /* Setting Selected Box Image */
    NSString * imgPathSelectedBox = [[NSBundle mainBundle] pathForResource:[images objectForKey:@"selected_box"] ofType:nil];
    UIImage * imgSelectedBox = [[UIImage alloc] initWithContentsOfFile:imgPathSelectedBox];
    [self setSelectionIndicatorImage:imgSelectedBox];
    [imgSelectedBox release];
    
    /* Setting Tab Items */
    NSArray * arrItems = [images objectForKey:@"tabitems"];
    for(int i=0; i<[arrItems count]; i++)
    {
        NSDictionary * d = [arrItems objectAtIndex:i];
        
        /* Loading Default Image */
        NSString * imgPathDefault = [[NSBundle mainBundle] pathForResource:[d objectForKey:@"off"] ofType:nil];
        UIImage * imgDefault = [[UIImage alloc] initWithContentsOfFile:imgPathDefault];
        
        /* Loading Selected Image */
        NSString * imgPathSelected = [[NSBundle mainBundle] pathForResource:[d objectForKey:@"on"] ofType:nil];
        UIImage * imgSelected = [[UIImage alloc] initWithContentsOfFile:imgPathSelected];
        
        /* Setting Images */
        UITabBarItem * tabBarItem = [self.items objectAtIndex:i];
        [tabBarItem setFinishedSelectedImage:imgSelected withFinishedUnselectedImage:imgDefault];
        [imgDefault release];
        [imgSelected release];   
        
        /* Setting Title Attributes */
        NSString * fontName = [titleSettings objectForKey:@"font_name"];
        float fontSize = [[titleSettings objectForKey:@"font_size"] floatValue];
        float vOffset = [[titleSettings objectForKey:@"vertical_offset"] floatValue];
        float dr = [[[titleSettings objectForKey:@"default_color"] objectForKey:@"r"] floatValue];
        float dg = [[[titleSettings objectForKey:@"default_color"] objectForKey:@"g"] floatValue];
        float db = [[[titleSettings objectForKey:@"default_color"] objectForKey:@"b"] floatValue];
        float sr = [[[titleSettings objectForKey:@"selected_color"] objectForKey:@"r"] floatValue];
        float sg = [[[titleSettings objectForKey:@"selected_color"] objectForKey:@"g"] floatValue];
        float sb = [[[titleSettings objectForKey:@"selected_color"] objectForKey:@"b"] floatValue];
        UIColor * colorDefault = [[UIColor alloc] initWithRed:dr/255 green:dg/255 blue:db/255 alpha:1];
        UIColor * colorSelected = [[UIColor alloc] initWithRed:sr/255 green:sg/255 blue:sb/255 alpha:1];

        [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, vOffset)];
        
        NSMutableDictionary * att = [[NSMutableDictionary alloc] init];
        
        [att setObject:[UIFont fontWithName:fontName size:fontSize] forKey:UITextAttributeFont];
        
        [att setObject:colorDefault forKey:UITextAttributeTextColor];
        [tabBarItem setTitleTextAttributes:att forState:UIControlStateNormal];
        
        [att setObject:colorSelected forKey:UITextAttributeTextColor];
        [tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];

        [att release];
        [colorDefault release];
        [colorSelected release];                                                
    }
    
    [plist release];
}


@end
