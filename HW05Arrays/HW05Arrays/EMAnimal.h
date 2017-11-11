//
//  EMAnimal.h
//  HW05Arrays
//
//  Created by Evgeny Mikhaylov on 06.11.17.
//  Copyright © 2017 EM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMAnimal : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *nickname;
@property (assign, nonatomic) NSInteger year;

- (void) moving;

@end
