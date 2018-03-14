@import UIKit

@implementation UIButton(UIButtonMagic)


#pragma mark - [Creating a UIImage from a UIColor to use as a background image for UIButton [duplicate]](https://stackoverflow.com/questions/6496441/creating-a-uiimage-from-a-uicolor-to-use-as-a-background-image-for-uibutton)


- (void)setBackgroundColor: (UIColor *)backgroundColor forState:(UIControlState) state{
    
    [self setBackgroundImage: [UIButton imageFromColor: backgroundColor] forState: state];
    
    
}

+ (UIImage *)imageFromColor: (UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark -setBtnImage Mode


- (void)setBtnImage{

//Button setImage设置的图片默认是会拉伸缩放的，如果我想要Aspect Fit的效果，要如何做呢？一开始我想到了用contentMode属性，很可惜不起作用。后来我发现button有一个imageView属性，设置它的contentMode就OK了。代码如下：

UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
button.imageView.contentMode = UIViewContentModeScaleAspectFit;
}


@end


#pragma mark - Creating a UIImage, More

@interface UIButton(more)


@end


@implementation UIButton(more)

- (void)setBackgroundColor: (UIColor *)backgroundColor forState:(UIControlState) state{
    
    [self setBackgroundImage: [UIButton imageFromColor: backgroundColor] forState: state];
    
    
}

+ (UIImage *)imageFromColor: (UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end




