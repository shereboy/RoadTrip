//
//  RTTestDriveViewController.m
//  RoadTrip
//
//  Created by Tolga Seremet on 7/5/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import "RTTestDriveViewController.h"

@interface RTTestDriveViewController ()

@end

@implementation RTTestDriveViewController

@synthesize TestTextBox;
@synthesize TestTextBox2;

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

- (IBAction)TestDriveButton:(id)sender {
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
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
  
  NSLog([NSString stringWithFormat:@"%@%@%@",@"deger: ",textField.text]);
}

@end
