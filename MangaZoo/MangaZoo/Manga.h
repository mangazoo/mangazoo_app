//
//  Manga.h
//  MangaZoo
//
//  Created by Allen Wong on 12/17/13.
//  Copyright (c) 2013 Allen Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manga : NSObject
@property (strong, nonatomic) NSNumber * mangaID;
@property (strong, nonatomic) NSString * mangaTitle;
@property (strong, nonatomic) UIImage * mangaImage;
@property (strong, nonatomic) NSNumber * mangaNumberCH;

@end
