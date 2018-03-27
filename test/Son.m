

#import "Son.h"
#import "Sark.h"

@implementation Son
- (instancetype)init
{
    self = [super init];
    if (self) {

        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
        
        /*super 只是一个编译器标示符，让其在运行时调用 objc_msgSendSuper，去调用父类的方法
        objc_msgSendSuper(struct objc_super *super, SEL op, ...)
         struct objc_super {
         __unsafe_unretained id receiver;
         __unsafe_unretained Class super_class;
         };
         NSLog((NSString *)&__NSConstantStringImpl__var_folders_gm_0jk35cwn1d3326x0061qym280000gn_T_main_a5cecc_mi_1, NSStringFromClass(((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){ (id)self, (id)class_getSuperclass(objc_getClass("Son")) }, sel_registerName("class"))));
         */
    }
    return self;
}
@end
