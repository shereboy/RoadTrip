//
//  RTTestDriveViewController.m
//  RoadTrip
//
//  Created by Tolga Seremet on 7/5/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import "RTTestDriveViewController.h"
#import "RTAppDelegate.h"



@interface RTTestDriveViewController ()

@end

@implementation RTTestDriveViewController

#pragma mark - Properties

@synthesize TestTextBox;
@synthesize TestTextBox2;
@synthesize TestTextBox3;
@synthesize TestImageView;

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
  
  RTAppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
  
  Device* myTestDevice = [appDelegate myDevice];
  
}

- (void) viewDidAppear:(BOOL)animated
{
  NSLog(@"Test Drive View Appeared");
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

- (IBAction)TestDriveButton:(id)sender {
}
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
