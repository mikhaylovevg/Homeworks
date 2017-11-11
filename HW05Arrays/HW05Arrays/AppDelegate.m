//
//  AppDelegate.m
//  HW05Arrays
//
//  Created by Evgeny Mikhaylov on 06.11.17.
//  Copyright © 2017 EM. All rights reserved.
//

#import "AppDelegate.h"
#import "EMHuman.h"
#import "EMBicyclist.h"
#import "EMRunner.h"
#import "EMSwimmer.h"
#import "EMRacer.h"
#import "EMAnimal.h"
#import "EMCat.h"
#import "EMDog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    EMHuman *human         = [[EMHuman alloc] init];
    EMBicyclist *bicyclist = [[EMBicyclist alloc] init];
    EMRunner *runner       = [[EMRunner alloc] init];
    EMSwimmer *swimmer     = [[EMSwimmer alloc] init];
    EMRacer *racer         = [[EMRacer alloc] init];
    
    human.name   = @"Maxim";
    human.height = 1.78;
    human.weight = 68.0;
    human.gender = @"male";
    
    bicyclist.name   = @"Oleg";
    bicyclist.height = 2.03;
    bicyclist.weight = 58.8;
    bicyclist.gender = @"male";
    
    runner.name   = @"Kate";
    runner.height = 1.63;
    runner.weight = 50.0;
    runner.gender = @"female";
    
    swimmer.name   = @"Dima";
    swimmer.height = 1.65;
    swimmer.weight = 78.2;
    swimmer.gender = @"male";
    
    racer.name   = @"Anna";
    racer.height = 1.50;
    racer.weight = 49.6;
    racer.gender = @"female";
    racer.car = @"BMW";
    racer.age = 30;
    
    NSLog(@"----level pupil----");
    
    NSArray *arrayOfHumans = @[human, bicyclist, runner, swimmer];

    for (EMHuman *human in arrayOfHumans) {
        
        NSLog(@"%@ - %@ - %.2f meters - %.1f kg", human.name, human.gender, human.height, human.weight);
        
        [human moving];
    }
    
    NSLog(@"----level student----");
    
    NSArray *someArrayOfHumans = @[human, bicyclist, runner, swimmer, racer];
    
    for (NSInteger i = [someArrayOfHumans count] - 1; i >= 0; i--) {
        
        EMHuman *current = someArrayOfHumans[i];
        
        NSLog(@"%@ - %@ - %.2f meters - %.1f kg", current.name, current.gender, current.height, current.weight);
        
        [current moving];
        
        if ([current isKindOfClass:[EMRacer class]]) {
            
            EMRacer* racer = (EMRacer*) someArrayOfHumans[i];
            
            NSLog(@"%@ %ld years old, car: %@", racer.name, (long)racer.age, racer.car);
        }
    }
    
    NSLog(@"----level master----");
    
    EMAnimal *animal = [[EMAnimal alloc] init];
    [animal setType: @"animal"];
    [animal setNickname: @"Rex"];
    [animal setYear: 1];
    
    EMCat *cat = [[EMCat alloc] init];
    [cat setType: @"cat"];
    [cat setNickname: @"Kasha"];
    [cat setYear: 2];
    
    EMDog *dog = [[EMDog alloc] init];
    [dog setType: @"dog"];
    [dog setNickname: @"Dzhulbars"];
    [dog setYear: 5];
    
    NSArray *array = @[human, bicyclist, runner, swimmer, racer, animal, cat, dog];
    
    for (NSInteger i = 0; i < [array count]; i++) {
        
        if ([array[i] isKindOfClass:[EMHuman class]]) {
            
            EMHuman *somehuman = (EMHuman *) array[i];
            
            NSLog(@"%@", NSStringFromClass([EMHuman class]));
            NSLog(@"%@ - %@ - %.2f meters - %.1f kg", somehuman.name, somehuman.gender, somehuman.height, somehuman.weight);
            
            [somehuman moving];
            
        } else if ([array[i] isKindOfClass:[EMAnimal class]]) {
            
            EMAnimal* animal = (EMAnimal *) array[i];
            
            NSLog(@"%@", NSStringFromClass([EMAnimal class]));
            NSLog(@"%@ - %@  - %d years old", animal.type, animal.nickname, animal.year);
            
            [animal moving];
        }
    }
    
    NSLog(@"----level star----");

    NSArray *arrayOfAnimals = @[animal, cat, dog];
    
    NSInteger count = MAX([arrayOfAnimals count], [someArrayOfHumans count]);
    
    for (NSInteger i = 0; i < count; i++) {
        if (i < [someArrayOfHumans count]) {
            
            EMHuman *currentHuman = someArrayOfHumans[i];
            
            NSLog(@"HUMAN %@ - %@ - %.2f meters - %.1f kg", currentHuman.name, currentHuman.gender, currentHuman.height, currentHuman.weight);
        }
        if (i < [arrayOfAnimals count]) {
            
            EMAnimal *currentAnimal = arrayOfAnimals[i];
            
            NSLog(@"ANIMAL %@ - %@  - %d years old", currentAnimal.type, currentAnimal.nickname, currentAnimal.year);
        }
    }
    
    NSLog(@"----level superstar----");

    //NSArray *totalArray = @[racer, animal, bicyclist, runner, cat, swimmer, dog, human];
    /*
    NSArray *sortedArray = [arrayOfAnimals sortedArrayUsingComparator:ˆNSComparisonResult:(id obj1, id obj2) {

        
    }];
    */
    /*
    NSArray *sortedArray = [totalArray sortedArrayUsingComparator: ˆ(id obj1, id obj2){
        if ([obj1 isKindOfClass:[EMHuman class]]) {
            
            EMHuman *s1 = obj1;
            EMHuman *s2 = obj2;
            
            if (s1.name > s2.name) {
                return (NSComparisonResult)NSOrderedAscending;
            } else if s1.name > s2.name) {
                return (NSComparisonResult)NSOrderedDescending;
            }
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return sortedArray;
    */

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
