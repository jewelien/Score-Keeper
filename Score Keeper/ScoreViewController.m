//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Julien Guanzon on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController () <UITextFieldDelegate>


@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) NSMutableArray *scoreLabels;

@property(nonatomic, strong) UILabel *label;

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"Score Keeper";
    
    self.scoreLabels = [NSMutableArray new];
    
    float screenWidth = self.view.frame.size.width;
    float screenHeight = self.view.frame.size.height;

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [self.view addSubview: scrollView];
    self.scrollView = scrollView;
    
//    [self addScoreView:1];
    
    for (NSInteger i = 0;i < 6; i++) {
        [self addScoreView:i];
    }
    
}


- (void)addScoreView:(NSInteger)index {
    
    float screenWidth = self.view.frame.size.width;
    float screenHeight = 80;
    float margin = 20;
    float nameFieldWidth = 90;
    float labelWidth = 60;
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight * index, screenWidth, screenHeight)];
    view.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:view];
    
    UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, 50, 50)];
    nameField.delegate = self;
    nameField.placeholder = @"Name";
    [view addSubview:nameField];
    nameField.backgroundColor = [UIColor yellowColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(margin + nameFieldWidth, margin, 20, 50)];
    label.text = @"0";
    [self.scoreLabels addObject:label];
    [view addSubview:label];
    self.label = label;
    label.backgroundColor = [UIColor whiteColor];
    
    
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(margin + labelWidth + nameFieldWidth, margin, 10, 50)];
    stepper.tag = index;
    stepper.minimumValue = -10;
    stepper.maximumValue = 100;
    [stepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:stepper];
    stepper.backgroundColor = [UIColor orangeColor];
    
    
    
    
}


- (void)stepperAction:(id)sender {
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double value = [stepper value];

//    UILabel *label = self.scoreLabels[index]; //SET LABEL AS PROPERTY INSTEAD
    self.label = self.scoreLabels[index];
    self.label.text = [NSString stringWithFormat:@"%d", (int)value];
    
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
