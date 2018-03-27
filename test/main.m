

#import <Foundation/Foundation.h>
#import "Sark.h"
#import "Son.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /* 1.isKindOfClass用来判断某个对象是否属于某个类，或者是属于某个派生类的实例。
         2.isMemberOfClass用来判断某个对象是否是某个类的实例。
         - (BOOL)isKindOfClass:(Class)cls {
         for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
         if (tcls == cls) return YES;
         }
         return NO;
         }
         - (BOOL)isMemberOfClass:(Class)cls {
         return [self class] == cls;
         }
         
         Class object_getClass(id obj)
         {
         if (obj) return obj->getIsa();
         else return Nil;
         }
         //获取class
         + (Class)class {
         return self;
         }
         - (Class)class {
         return object_getClass(self);
         }
        */
        
        Sark *sarkObject = [[Sark alloc] init];
        //NSObject 类对象，调用-class 即object_getClass，即调用getIsa获取其元类 即NSObject的 MetaClass
        //NSObject 的 metaClass 继承于 NSObject，所以isKindOfClass 为1
        //isMemberOfClass = 0
        BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];//1
        BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];//0

        BOOL res3 = [(id)[Sark class] isMemberOfClass:[Sark class]];//0
        BOOL res4 = [(id)[Sark class] isKindOfClass:[Sark class]];//0
        NSLog(@"res1-- res4 %d,%d,%d,%d",res1,res2,res3,res4);

        const char *charStr = object_getClassName([Sark class]);
        id obj1 = [Sark class];
        id obj2 = objc_getMetaClass(charStr);
        NSLog(@"[Sark class] = %p,isMeta = %d",obj1,class_isMetaClass(obj1));
        NSLog(@"objc_getMetaClass = %p,isMeta = %d",obj2,class_isMetaClass(obj2));
    
        
        //[Sark class], Sark 作为一个类对象调用class，则调用-（Class）class方法
        //Sark 类对象，调用-class 即object_getClass，即调用getIsa获取其元类 即Sark的 MetaClass
        BOOL res5 = [[Sark class] isMemberOfClass:objc_getMetaClass(charStr)];
        //所以，Sark 不是 [Sark class] 类的实例对象
        BOOL res6 = [[Sark class] isMemberOfClass:[Sark class]];
        //同理， isKindOf 也是 0
        BOOL res7 = [[Sark class] isKindOfClass:[Sark class]];
        NSLog(@"res5--res7 %d,%d,%d",res5,res6,res7);

        
        //实例调用方法,sarkObject 调用-class，即object_getClass，即调用getIsa获取其元类，即SarkClass
        BOOL res8 = [sarkObject isKindOfClass:[Sark class]];
        BOOL res9 = [sarkObject isMemberOfClass:[Sark class]];
        NSLog(@"res8-- res9 %d,%d",res8,res9);

        Son *son = [[Son alloc] init];
        
    }
    return 0;
}
