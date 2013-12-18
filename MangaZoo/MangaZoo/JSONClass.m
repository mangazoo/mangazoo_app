//
//  JSONClass.m
//  MangaZoo
//
//  Created by Allen Wong on 12/17/13.
//  Copyright (c) 2013 Allen Wong. All rights reserved.
//

#import "JSONClass.h"
#import "Manga.h"
#define loansURL [NSURL URLWithString: @"https://www.mangaeden.com/api/list/0/"]
#define mainQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)

@interface JSONClass ()


@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSURLConnection * theConnection;
@property (strong, nonatomic) NSMutableData * receivedData;
@property (strong, nonatomic) NSMutableDictionary * jsonDictionary;



@end


@implementation JSONClass




//share only one Singleton class
+(JSONClass*) sharedInstance{
    static JSONClass * sharedSingletion = nil;

    if (sharedSingletion == nil) {
        
        sharedSingletion = [[super allocWithZone:nil]init];
    }
    
    return  sharedSingletion;
}

+(id) allocWithZone:(NSZone *)zone{
    
    return [self sharedInstance];
    
}


- (id)init{
    
    self = [super init];
    if(self){
        
        
        self.mangaArray = [NSMutableArray new];
        self.receivedData = [NSMutableData new];
        NSURLRequest * theRequest = [NSURLRequest requestWithURL:loansURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
        self.theConnection =[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//        self.descriptionArray = [NSMutableArray new];
//        dispatch_async(mainQueue, ^{
//            NSData * data = [NSData dataWithContentsOfURL:loansURL];
//            if (data != nil){
//                [self performSelectorOnMainThread:@selector(dataRetreived:) withObject:data waitUntilDone:YES];
//                
//            }else{
//                
//            }
//            
//        });
        
        
    }
    
    
    return self;
}


- (void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response{
    self.receivedData = [NSMutableData new];
    [self.receivedData setLength:0];

}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

    NSString * errorMessage = [NSString stringWithFormat:@"%@",[error localizedDescription]];

    UIAlertView * errorAlert = [[UIAlertView alloc]initWithTitle:@"Connection Fail" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];

    [errorAlert show];

}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection{

    [self dataRetreived:self.receivedData];

}


- (void) dataRetreived:(NSData *) dataResponse{
    NSError * error;
    self.jsonDictionary = [NSJSONSerialization JSONObjectWithData:dataResponse options:kNilOptions error:&error];
    NSArray *listOfMangaArray = [self.jsonDictionary valueForKey:@"manga"];
    
    [self willChangeValueForKey:@"manga"];
    for (int i = 0; i < listOfMangaArray.count; i++){
        
        NSDictionary * dictionary = [listOfMangaArray objectAtIndex:i];
        Manga * newMange = [Manga new];
        newMange.mangaTitle = [dictionary objectForKey:@"t"];
//        NSLog(@"Title -> %@",newMange.mangaTitle);
        newMange.mangaID = [dictionary objectForKey:@"i"];
        newMange.mangaImage = [dictionary objectForKey:@"im"];

        [self.mangaArray addObject:newMange];
    }
    [self didChangeValueForKey:@"manga"];
    
}



@end
