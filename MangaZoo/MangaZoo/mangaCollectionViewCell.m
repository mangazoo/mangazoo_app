//
//  mangaCollectionViewCell.m
//  MangaZoo
//
//  Created by Dani Munoz on 12/17/13.
//  Copyright (c) 2013 Allen Wong. All rights reserved.
//

#import "mangaCollectionViewCell.h"

@interface mangaCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *mangaImageView;
@property (weak, nonatomic) IBOutlet UILabel *mangaTitleLabel;

@end

@implementation mangaCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setMangaImage:(UIImage *) image andTitle:(NSString *)title
{
    self.mangaImageView.image = image;
    self.mangaTitleLabel.text = title;
}

@end
