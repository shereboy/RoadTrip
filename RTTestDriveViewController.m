//
//  RTTestDriveViewController.m
//  RoadTrip
//
//  Created by Tolga Seremet on 7/5/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import "RTTestDriveViewController.h"
#import "RTAppDelegate.h"
#import "Constants.h"



@interface RTTestDriveViewController ()

@end

@implementation RTTestDriveViewController

#pragma mark - Properties

@synthesize TestTextBox;
@synthesize TestTextBox2;
@synthesize TestTextBox3;
@synthesize TestImageView;
@synthesize testDriveButton;
@synthesize car;

#pragma mark - Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.  
  
  // App delegatedeki objeyi init edip burdan kullaniyoruz.
  RTAppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
  
  Device* myTestDevice = [appDelegate myDevice];
  
  NSLog(TrophyAssetFolder);

  
  UIButton* view =[[UIButton alloc]initWithFrame:CGRectMake(0,0,100,100)];
  view.backgroundColor = [UIColor blackColor];
  
  [view addTarget:self action:@selector(rectClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
  [self.view addSubview:view];
  
}

-(IBAction)rectClicked:(id)sender{
  NSLog(@"Rectangle Clicked");
}


- (void) viewDidAppear:(BOOL)animated
{
  NSLog(@"Test Drive View Appeared");
  self.title = @"Test Drive Title";
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}



- (IBAction)TFValueChanged:(id)sender
{
  //NSLog(sender);
  NSLog(@"value changed");
  
  UITextField *tf = (UITextField *) sender;
  NSLog(tf.text);
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}



#pragma mark - Custom Methods

- (IBAction)TestDrive:(id)sender {
  
  CGPoint center = CGPointMake(self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height/2);
  
 NSLog([
        NSString stringWithFormat:@"%@%f%@%f%@%f",@"koordinatlar; \nx: ",
        self.car.center.x,
        @"\norigin_y: ",
        self.view.frame.origin.y,
        @"\ncar frame size height: ",
        self.car.frame.size.height
        ]);
  

   [UIView animateWithDuration:3
                   animations: ^{
                     self.car.center = center;
                     self.car.alpha = 0.5;
                     self.car.transform = CGAffineTransformMakeRotation(M_PI);
                   }
                   completion: ^(BOOL finished) {
                     [self rotate];
                     //[self.car removeFromSuperview];
                   }
    ];
}

-(void) rotate {
  //self.car.transform = CGAffineTransformMakeRotation(M_PI*2);
  
  
  [UIView animateWithDuration:3
                   animations: ^{
                     self.car.transform = CGAffineTransformMakeRotation(M_PI*2);
                   }
   ];
  
}

-(void) returnCar {}

-(void) continueRotation {}

- (IBAction)ShowHideToogle:(id)sender {
  
  if (TestImageView.hidden)
    TestImageView.hidden = false;
  else
    TestImageView.hidden = true;
}

-(IBAction)textFieldDidBeginEditing:(UITextField *)textField:(id)sender
{
  // NSLog ((UITextField *)id . value);
  NSLog(@"text field is being edited");
  
}

-(IBAction)textFieldDidEndEditing:(UITextField *)textField:(id)sender
{
  // NSLog ( @"ali " @"veli " @"49 " @"50" );
  //NSLog (textField.text);
  
  NSLog([NSString stringWithFormat:@"%@%@",@"deger: ",textField.text]);
}

@end
