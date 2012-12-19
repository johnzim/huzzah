//
//  GBJsonParserYo.m
//  GridBuddy
//
//  Created by John Louis Swaine on 19/12/2012.
//  Copyright (c) 2012 John Louis Swaine. All rights reserved.
//

#import "GBJsonParserYo.h"

@implementation GBJsonParserYo


-(void)goodTimesJsonParser {
    
    NSFileManager* fm = [[NSFileManager alloc] init];
    NSURL* docsurl = [fm URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL* fileurl = [docsurl URLByAppendingPathComponent:@"superhappyjsondata.txt"];
    
    NSData* jsonData = [[NSData alloc] initWithContentsOfURL:fileurl];
    
    NSDictionary* dataObject = [NSJSONSerialization JSONObjectWithData: jsonData options: NSJSONReadingMutableContainers error: nil];

    
    NSArray* imagesArray =  [jsonData valueForKey:@"images"];
    
    for (NSDictionary* imageDict in imagesArray) {
        
        NSString* sizeDictKey = @"";
        
        for (sizeDictKey in imageDict) {
            
            NSDictionary* sizeDict = [imageDict valueForKey:sizeDictKey];
            
            NSLog(@"Height: %@", [sizeDict valueForKey:@"height"]);
            NSLog(@"Width: %@", [sizeDict valueForKey:@"width"]);
        }
    }
    
    
    // the times they are a changing
    
    // All you'd need to do is make a change to any of the NS foundation data objects above (ie: the Arrays and Dictionaries) and since they're all still 'contained' (or rather all have pointers to them stored inside of) dataObject, when you serialise out dataObject using the NSJSONSerialization class, you can then write all the changes out to disk!
    
    NSData* newJsonData = [NSJSONSerialization dataWithJSONObject:dataObject options:NSJSONReadingMutableContainers error:nil];
    [newJsonData writeToURL:fileurl atomically:YES];
    
}





@end
