//
//  ViewController.m
//  MangaZoo
//
//  Created by Allen Wong on 12/17/13.
//  Copyright (c) 2013 Allen Wong. All rights reserved.
//

#import "ViewController.h"
#import "mangaCollectionViewCell.h"
<<<<<<< HEAD
<<<<<<< HEAD

<<<<<<< HEAD

@interface ViewController ()
=======
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mangaCollectionView;
>>>>>>> 5388369fdd4b3f371446952947dd5783c7eb80ac

@property (strong, nonatomic) JSONClass *jsonOBJ;
=======

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mangaCollectionView;
>>>>>>> 5388369fdd4b3f371446952947dd5783c7eb80ac
=======

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mangaCollectionView;
>>>>>>> 5388369fdd4b3f371446952947dd5783c7eb80ac

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
<<<<<<< HEAD
    self.jsonOBJ = [JSONClass sharedInstance];
    

    [self.jsonOBJ addObserver:self forKeyPath:@"manga" options:0 context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"manga"]){
        Manga * tmpb = [self.jsonOBJ.mangaArray objectAtIndex:0];
//        self.image.image = tmpb.mangaImage;
        
        NSLog(@"Displayed");
    }
=======
	// Do any additional setup after loading the view, typically from a nib.
    [self.mangaCollectionView setDelegate:self];
    [self.mangaCollectionView setDataSource:self];
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5388369fdd4b3f371446952947dd5783c7eb80ac
=======
>>>>>>> 5388369fdd4b3f371446952947dd5783c7eb80ac
=======
>>>>>>> 5388369fdd4b3f371446952947dd5783c7eb80ac
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
