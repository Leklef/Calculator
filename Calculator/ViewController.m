//
//  ViewController.m
//  Calculator
//
//  Created by Ленар on 15.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@property (nonatomic) int index;
@property (strong, nonatomic) ViewController2 *vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 0;
    _vc = [[ViewController2 alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)del:(id)sender{
    n=0;
    [self toDisplay];
}

-(IBAction)clear:(id)sender{
    n = 0;
    m = 0;
    [self toDisplay];
    operationEnter = NO;
}

-(IBAction)num:(id)sender{
    if(operationEnter){
        m = n;
        n = 0;
        operationEnter = NO;
    }
    n = (n * 10.0f) + [sender tag];
    NSLog(@"%li", (long)[sender tag]);
    [self toDisplay];
}

-(IBAction)operation:(id)sender{
    if (doubleOperation){
        if (!operationEnter){
            NSLog(@"%li", (long)[sender tag]);
            if (operation == 101){
                _vc.resultString = [NSString stringWithFormat:@"%g +", n];
                _vc.resultString = [NSString stringWithFormat:@"%@ %g",_vc.resultString, m];
                [_vc updateResultLabel];
                n = m + n;
                _vc.resultString = [NSString stringWithFormat:@"%@ = %g",_vc.resultString, n];
            }
            if (operation == 102){
                _vc.resultString = [NSString stringWithFormat:@"%g -", n];
                _vc.resultString = [NSString stringWithFormat:@"%@ %g",_vc.resultString, m];
                n = m - n;
                _vc.resultString = [NSString stringWithFormat:@"%@ = %g",_vc.resultString, n];
            }
            if (operation == 103){
                _vc.resultString = [NSString stringWithFormat:@"%g *", n];
                _vc.resultString = [NSString stringWithFormat:@"%@ %g",_vc.resultString, m];
                n = m * n;
                _vc.resultString = [NSString stringWithFormat:@"%@ = %g",_vc.resultString, n];
            }
            if (operation == 104){
                _vc.resultString = [NSString stringWithFormat:@"%g /", n];
                _vc.resultString = [NSString stringWithFormat:@"%@ %g",_vc.resultString, m];
                n = m / n;
                _vc.resultString = [NSString stringWithFormat:@"%@ = %g",_vc.resultString, n];
            }
            if (operation == 201){
                double fact = 1;
                NSLog(@"%g %g",n, m);
                for(int i=0; i<5; i++){
                    for (int j=0; j<=i; j++){
                        fact = fact * (2*i+1);
                    }
                    n = n + pow(-1, i)*(pow(n, 2*i-1))/fact;
                    fact=1;
                }
                [self toDisplay];
            }
            if (operation == 202){
                double fact = 1;
                for(int i=0; i<6; i++){
                    for (int j=0; j<=i; j++){
                        fact = fact * (2*i);
                    }
                    m = m + pow(-1, i)*(pow(m, 2*i))/fact;
                    fact=1;
                }
                [self toDisplay];
            }
        }
    }
    m = n;
    operation = [sender tag];
    operationEnter = YES;
    doubleOperation = YES;
    [self toDisplay];
    
}

-(IBAction)inverse:(id)sender{
    n = -n;
    [self toDisplay];
}

-(IBAction)interest:(id)sender{
    n = m - ((m/100)*n);
}

-(void) toDisplay {
    NSString *str = [NSString stringWithFormat:@"%g", n];
    [displayLabel setText:str];
}

@end
