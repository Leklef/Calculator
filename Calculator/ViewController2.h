//
//  ViewController2.h
//  Calculator
//
//  Created by Ленар on 16.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

@property (strong, nonatomic) NSMutableArray *historyArray;

- (void) updateResultLabel : (int) num;

@end
