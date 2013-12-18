//
//  JSONClass.h
//  MangaZoo
//
//  Created by Allen Wong on 12/17/13.
//  Copyright (c) 2013 Allen Wong. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSONClass : NSObject

@property (strong, nonatomic) NSMutableArray * mangaArray;

+(JSONClass*) sharedInstance;

@end
