//
//  ViewController.m
//  MangaZoo
//
//  Created by Allen Wong on 12/17/13.
//  Copyright (c) 2013 Allen Wong. All rights reserved.
//

#import "ViewController.h"
#import "mangaCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mangaCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.mangaCollectionView setDelegate:self];
    [self.mangaCollectionView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    mangaCollectionViewCell * mangaCell = [self.mangaCollectionView dequeueReusableCellWithReuseIdentifier:@"manga_cell"
                                                                                              forIndexPath:indexPath];
    
    
    
    [mangaCell setMangaImage:nil andTitle:[NSString stringWithFormat:@"%d",indexPath.row]];
    
    return mangaCell;
}

@end
