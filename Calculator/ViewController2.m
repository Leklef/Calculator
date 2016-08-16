//
//  ViewController2.m
//  Calculator
//
//  Created by Ленар on 16.08.16.
//  Copyright © 2016 LeNComp. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel1;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel3;
@property (weak, nonatomic) IBOutlet UIImageView *secretImage;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) updateResultLabel: (int)num{
    if (num == 0){
        NSLog(@"%@", [_historyArray objectAtIndex:0]);
        _resultLabel1.text = [_historyArray objectAtIndex:0];
    }
    if (num == 1) {
        _resultLabel2.text = [_historyArray objectAtIndex:1];
    }
    if (num == 2) {
         _resultLabel3.text = [_historyArray objectAtIndex:2];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)secretButton:(id)sender {
    int randomValue = 1 + (random() % 6);
    NSLog(@"%i", randomValue);
    switch (randomValue) {
        case 1:
            [_secretImage setImage:[UIImage imageNamed:@"cat1"]];
            break;
        case 2:
            [_secretImage setImage:[UIImage imageNamed:@"cat2"]];
            break;
        case 3:
            [_secretImage setImage:[UIImage imageNamed:@"cat3"]];
            break;
        case 4:
            [_secretImage setImage:[UIImage imageNamed:@"cat4"]];
            break;
        case 5:
            [_secretImage setImage:[UIImage imageNamed:@"cat5"]];
            break;
        case 6:
            [_secretImage setImage:[UIImage imageNamed:@"cat6"]];
            break;
        default:
            break;
    }
}

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    _resultLabel1.text = [_historyArray objectAtIndex:0];
//    _resultLabel2.text = [_historyArray objectAtIndex:1];
//    _resultLabel3.text = [_historyArray objectAtIndex:2];
//}

@end
