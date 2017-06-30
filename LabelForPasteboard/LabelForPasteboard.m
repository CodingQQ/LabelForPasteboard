//
//  LabelForPasteboard.m
//  Mooc
//
//  Created by LeeQQ on 2017/6/28.
//  Copyright © 2017年 LeeQQ. All rights reserved.
//

#import "LabelForPasteboard.h"

@implementation LabelForPasteboard

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addGesture];
    }
    return self;
}
- (void)addGesture{
    UILongPressGestureRecognizer *gest = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu)];
    [self addGestureRecognizer:gest];
}
- (void)showMenu{
    [self becomeFirstResponder];
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
//    menu.arrowDirection = UIMenuControllerArrowUp;
    // 菜单最终显示的位置(一种是以自身的bounds  还有一种是以父控件的frame)
    [menu setTargetRect:self.bounds inView:self];
//    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
    
#if 0  // 可以添加自定义item
    menu.menuItems = @[
                       
                                 [[UIMenuItem alloc]initWithTitle:@"cancel" action:@selector(cancelClick)],
                                 [[UIMenuItem alloc]initWithTitle:@"good" action:@selector(goodClick)]
                                 ];
#endif
}
- (void)cancelClick{
    NSLog(@"cancelClick");
}
- (void)goodClick{
    NSLog(@"goodClick");
}


#pragma mark - UIMenuController相关
- (BOOL)canBecomeFirstResponder{
    return YES;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    NSLog(@"LabelForPasteboard-action:%@",NSStringFromSelector(action));
    // @"copy:",@"cut:",@"select:",@"selectAll:",@"paste:",
//    NSArray* methodNameArr = @[@"good",@"cancel"];
//    if ([methodNameArr containsObject:NSStringFromSelector(action)]) {
//        return YES;
//    }
    return [super canPerformAction:action withSender:sender];
}

#pragma mark - 监听MenuItem的点击事件
// 注意：如果方法不实现,是不会显示出来的
/** 全选 */
//- (void)selectAll:(id)sender{
//    NSLog_FL()
//    
//}
/** 剪切 */
- (void)cut:(UIMenuController *)menu
{
    // 将label的文字存储到粘贴板
    [UIPasteboard generalPasteboard].string = self.text;
    // 清空文字
    self.text = nil;
}
/** 赋值 */
- (void)copy:(UIMenuController *)menu
{
    // 将label的文字存储到粘贴板
    [UIPasteboard generalPasteboard].string = self.text;
}
/** 粘贴 */
- (void)paste:(UIMenuController *)menu
{
    // 将粘贴板的文字赋值给label
    self.text = [UIPasteboard generalPasteboard].string;
}



@end
