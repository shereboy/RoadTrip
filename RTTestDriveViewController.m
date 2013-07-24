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
#import "DPBrick.h"
#import "DPMove.h"
#import "AVFoundation/AVFoundation.h"
#import "AudioToolbox/AudioToolbox.h"




@interface RTTestDriveViewController ()
{
  AVAudioPlayer *backgroundAudioPlayer;
  SystemSoundID burnRubberSoundId;
  NSString *hodenString;
}

@end

@implementation RTTestDriveViewController

#pragma mark - Properties

@synthesize TestTextBox;
@synthesize TestTextBox2;
@synthesize TestTextBox3;
@synthesize TestImageView;
@synthesize testDriveButton;
@synthesize car;
@synthesize BrickStack;
@synthesize InitialBrickStack;
@synthesize BrickTimer;


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
  
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    NSLog(@"IPAD");
  }
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    NSLog(@"IPHONE");
  }

  //NSLog(@"%@%d",@"array count: ", [colorArray count]);
  
  
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  
  // App delegatedeki objeyi init edip burdan kullaniyoruz.
  
  NSURL* backgroundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource: @"CarRunning" ofType:@"aif"]];
  
  backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundURL error:nil];
  
  backgroundAudioPlayer.numberOfLoops = -1;
  [backgroundAudioPlayer prepareToPlay];
  
  NSURL* burnRubberURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource: @"BurnRubber" ofType:@"aif"]];
  
  AudioServicesCreateSystemSoundID((__bridge CFURLRef) burnRubberURL , &burnRubberSoundId );
  
  
  /*
  UIButton* view =[[UIButton alloc]initWithFrame:CGRectMake(0,0,50,50)];
  view.backgroundColor = [UIColor purpleColor];
  
  [view addTarget:self action:@selector(rectClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
  [self.view addSubview:view];
  */
  

  
}
                
-(void) swipeDetected : (UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"Swipe Detected");
}

-(void) drawBoard
{
  NSArray* colorArray =[NSArray arrayWithObjects:[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor orangeColor], nil];

  for (int i = 0; i<ROW_COUNT ; i++) {
    for (int j = 0; j<COL_COUNT; j++)
    {
    if (j !=0 && j%COL_COUNT == 0) continue;
      else
      {
        NSUInteger randomIndex = arc4random() % [colorArray count];
        DPBrick *brick = [DPBrick alloc];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
          brick.frameX=(j*IPAD_BOX_WIDTH+FRAME_LEFT_PADDING);
          brick.frameY=(i*IPAD_BOX_HEIGHT+FRAME_TOP_PADDING);
        }
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
          brick.frameX=(j*BOX_WIDTH+FRAME_LEFT_PADDING);
          brick.frameY=(i*BOX_HEIGHT+FRAME_TOP_PADDING);
        }
        
        
     
        brick.assignedColor = colorArray[randomIndex];
        brick.rowNumber = i;
        brick.colNumber = j;
        [InitialBrickStack addObject:brick];
        //[self drawRectangle:i*50+FRAME_LEFT_PADDING :j*50+FRAME_TOP_PADDING :colorArray[randomIndex]:i:j];
      }
    }
  }
  
  BrickTimer = [NSTimer scheduledTimerWithTimeInterval:ANIMATION_DURATION
                                                         target:self
                                                       selector:@selector(drawRectangleFromStack:)
                                                       userInfo:nil
                                                        repeats:YES
                         ];
  
  /*for(DPBrick *brick in InitialBrickStack)
    [self drawRectangle:brick.frameX:brick.frameY :brick.assignedColor:brick.rowNumber:brick.colNumber];*/
  
}

-(void) drawRectangleFromStack :(id) sender
{
  NSLog(@"TIMER WORKING");
  if ([InitialBrickStack count] > 0)
  {
  DPBrick *brick = [self.InitialBrickStack objectAtIndex:[self.InitialBrickStack count]-1];
 [self drawRectangle:brick.frameX:brick.frameY :brick.assignedColor:brick.rowNumber:brick.colNumber];
    

[InitialBrickStack removeLastObject];
  }
  else
  {
  [self.BrickTimer invalidate];
    self.BrickTimer = nil;
  }

  
  
  
}


-(void) drawRectangle:(int)x
                     :(int)y
                     :(UIColor*)color
                     :(int)rowNumber
                     :(int)colNumber
{
  
  DPBrick* thisBrick =[DPBrick alloc];
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    thisBrick =[[DPBrick alloc]initWithFrame:CGRectMake(x,y,IPAD_BOX_WIDTH,IPAD_BOX_HEIGHT)];
  }
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    thisBrick =[[DPBrick alloc]initWithFrame:CGRectMake(x,y,BOX_WIDTH,BOX_HEIGHT)];
  }
  
  
  thisBrick.colNumber = colNumber;
  thisBrick.rowNumber = rowNumber;
 
  thisBrick.backgroundColor = color;
  thisBrick.assignedColor = color;
  thisBrick.alpha = 0;
  
  CGPoint center = CGPointMake(thisBrick.center.x,thisBrick.center.y-ANIMATION_DISTANCE);
  
  thisBrick.center = center;
  
  
  
  center = CGPointMake(thisBrick.center.x,thisBrick.center.y+ANIMATION_DISTANCE);
  
  [UIView animateWithDuration: ANIMATION_DURATION
                   animations: ^{
                     thisBrick.alpha = 1;
                     thisBrick.center = center;
                                        }
                   completion: ^(BOOL finished) {
                   
                     //[self.car removeFromSuperview];
                   }
   ];
  
  //[view addTarget:self action:@selector(rectClicked:) forControlEvents:UIControlEventTouchDragInside];
  [self.view addSubview:thisBrick];
}


-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
  CGPoint touchLocation = [touch locationInView:self.view];
  
  NSLog( @"%@%f%@%f", @"Touch Oldu: ", touchLocation.x, @" - ", touchLocation.y );
  
  for(DPBrick *brick in self.view.subviews)
    if(CGRectContainsPoint(brick.frame,touchLocation) &&
       brick.backgroundColor != [UIColor blackColor] &&
       ![self.BrickStack containsObject:brick] &&
       [brick isKindOfClass:[DPBrick class]]
       )
    {
      if([self.BrickStack count]>0)
      {
        DPBrick *tmpBrick = [self.BrickStack objectAtIndex:[self.BrickStack count]-1];
        NSLog(@"%@%@%@", [self colorName:tmpBrick.assignedColor], @" - ", [self colorName:brick.assignedColor] );
        //if (tmpBrick.assignedColor == brick.assignedColor)
        if([DPMove isLegalMove:tmpBrick :brick])
        {
          
          [self.BrickStack addObject:brick];
          [self rectClicked:brick];
        }
        else
        {
        NSLog(@"arkaplan farkli");
        }
      }
      else
      {
        [self.BrickStack addObject:brick];
        [self rectClicked:brick];
      }
    }
 
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  
  [self.BrickStack removeAllObjects];
  
  for(DPBrick *brick in self.view.subviews)
    if([brick isKindOfClass:[DPBrick class]])
      brick.backgroundColor = brick.assignedColor;
}

/*-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
  CGPoint touchLocation = [touch locationInView:self.view];
  
  NSLog( @"%@%f%@%f", @"Touch Oldu: ", touchLocation.x, @" - ", touchLocation.y );
  
  for(UIButton *button in self.view.subviews)
    if(CGRectContainsPoint(button.frame,touchLocation))
      [self rectClicked:button];
}*/



-(IBAction)rectClicked:(id)sender{
  
  UIButton *button = (UIButton *) sender;
  button.backgroundColor= [UIColor blackColor];
  CGColorRef colorRef = button.backgroundColor.CGColor;
  NSString *boxColor = [CIColor colorWithCGColor:colorRef].stringRepresentation;
  NSLog(@"%@", boxColor);
  
}

-(NSString*)colorName:(UIColor*)color
{
  CGColorRef colorRef = color.CGColor;
  NSString *boxColor = [CIColor colorWithCGColor:colorRef].stringRepresentation;
  return boxColor;
}


- (void) viewDidAppear:(BOOL)animated
{
  NSLog(@"Test Drive View Appeared");
  self.title = @"Test Drive Title";
 //   [self drawBoard];
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

-(void) playCarSound
{
  [backgroundAudioPlayer play];
}

- (IBAction)TestDrive:(id)sender {
  
  AudioServicesPlaySystemSound(burnRubberSoundId);
  
  [self performSelector:@selector(playCarSound) withObject:self afterDelay:.2];
  
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
