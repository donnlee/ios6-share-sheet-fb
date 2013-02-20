//
//  SocialAppViewController.m
//  SocialApp
//
//  Created by Donn Lee on 2/13/13.
//  Copyright (c) 2013 ploo. All rights reserved.
//

#import "SocialAppViewController.h"

@interface SocialAppViewController ()

@end

@implementation SocialAppViewController

- (IBAction)selectImage:(id)sender {
    // This presents the image picker to the user.
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imagePicker =
          [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
          UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = [NSArray
                                  arrayWithObjects:(NSString *)kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [_postText resignFirstResponder];
}

- (IBAction)sendPost:(id)sender {
    NSArray *activityItems;
    
    if (_postImage.image != nil) {
        activityItems = @[_postText.text, _postImage.image];
    } else {
        activityItems = @[_postText.text];
    }
    
    UIActivityViewController *activityController =
    [[UIActivityViewController alloc]
     initWithActivityItems:activityItems
     applicationActivities:nil];
    
    [self presentViewController:activityController
                       animated:YES
                     completion:nil];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // This updates the delegate method to update our postImage imageview
    // with the selected photo.
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        _postImage.image = image;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
    // donn: reset imageview if picker is cancelled.
    _postImage.image = nil;
}


// Common super methods below:

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
