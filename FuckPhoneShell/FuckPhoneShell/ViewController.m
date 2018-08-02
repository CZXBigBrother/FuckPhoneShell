//
//  ViewController.m
//  FuckPhoneShell
//
//  Created by marco chen on 2018/8/2.
//  Copyright © 2018年 marco chen. All rights reserved.
//
#define ScreenWidth       [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight      [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImagePickerController *pickerCon = [[UIImagePickerController alloc]init];
    pickerCon.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    pickerCon.allowsEditing = NO;//是否可编辑
    pickerCon.delegate = self;
    [self presentViewController:pickerCon animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];//获取编辑后的照片
    self.image = image;
    [self checkImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)checkImage {
    for (UIView * view in self.view.subviews) {
        if (view.tag == 99) {
            view.removeFromSuperview;
        }
    }
    NSInteger count = 7;
    CGFloat oneHeight = ScreenHeight / 10;
    CGFloat oneWidth = ScreenWidth / count;
    CGFloat oneSmallHeight = oneHeight / 4;
    
    CGFloat oneImageHeight = self.image.size.height / 10 ;
    CGFloat oneImageWidht = self.image.size.width / count;
    CGFloat oneImageSmallHeight = oneImageHeight / 4;

    for (int j = 0; j < 10; j ++) {
        sleep(2);
        @autoreleasepool {
            NSMutableArray * colors = [NSMutableArray arrayWithCapacity:10];
            for (int i = 1; i < count; i ++) {
                @autoreleasepool {
                    UIColor * COLOR1 =  [self colorAtPixel:CGPointMake(oneImageWidht * i, oneImageSmallHeight + oneImageHeight * j) withImage:[self.image copy]];
                    NSLog(@"oneWidth * i = %lf , oneSmallHeight + oneHeight * j = %lf",oneImageWidht * i,oneImageSmallHeight + oneImageHeight * j);
                    sleep(0.5);
                    UIColor * COLOR2 =  [self colorAtPixel:CGPointMake(oneImageWidht * i, oneImageSmallHeight * 2 + oneImageHeight * j) withImage:[self.image copy]];
                    sleep(0.5);
                    UIColor * COLOR3 =  [self colorAtPixel:CGPointMake(oneImageWidht * i, oneImageSmallHeight * 3 + oneImageHeight * j) withImage:self.image];
                    sleep(0.5);
                    const CGFloat * CR1 =  CGColorGetComponents(COLOR1.CGColor);
                    const CGFloat * CR2 =  CGColorGetComponents(COLOR2.CGColor);
                    const CGFloat * CR3 =  CGColorGetComponents(COLOR3.CGColor);
                    CGFloat r = (CR1[0] + CR2[0] + CR3[0]) / 3.0;
                    CGFloat g = (CR1[1] + CR2[1] + CR3[1]) / 3.0;
                    CGFloat b = (CR1[2] + CR2[2] + CR3[2]) / 3.0;
//                    [colors addObject:(__bridge id)COLOR1.CGColor];
//                        [colors addObject:(__bridge id)[UIColor colorWithDisplayP3Red:r green:g blue:b alpha:1].CGColor];
                    
                    //不要问我为什么转换来又转换去,这是一个半小时的Demo就不要这多要求好不好 我懒
                    [colors addObject:[UIColor colorWithDisplayP3Red:r green:g blue:b alpha:1]];
                }
            }
//            CAGradientLayer * gradientLayer = [self createCAGradientLayer:colors];
            UIColor * bgColor =  [self createColorBackground:colors];
            UIView * view = [[UIView alloc]init];
            view.backgroundColor = bgColor;
//            [view.layer addSublayer:gradientLayer];
            view.frame = CGRectMake(0, j * oneHeight, ScreenWidth, oneHeight);
            view.tag = 99;
            [self.view addSubview:view];
        }
    }

}
- (UIColor *)createColorBackground:(NSMutableArray *)arr {
    NSInteger count = arr.count;
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    for (UIColor *color in arr) {
        const CGFloat * CR1 =  CGColorGetComponents(color.CGColor);
        r += CR1[0];
        g += CR1[1];
        b += CR1[2];
    }
    r = r / count;
    g = g / count;
    b = b / count;
    
    return [UIColor colorWithDisplayP3Red:r green:g blue:b alpha:1];
}
- (CAGradientLayer *)createCAGradientLayer:(NSMutableArray *)arr{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = arr;
    gradientLayer.locations = @[@0.2, @0.4, @0.6,@0.8,@1];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = CGRectMake(0, 0  , ScreenWidth, ScreenHeight / 10);
    return gradientLayer;
//    [self.view.layer addSublayer:gradientLayer];
}




- (UIColor *)colorAtPixel:(CGPoint)point withImage:(UIImage*)image{
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = image.CGImage;
    NSUInteger width = image.size.width;
    NSUInteger height = image.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast |     kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
