# CoreImage 学习笔记

#Processing Images
##主要依赖*CIFilter*和*CIImage*这两个类对图片进行处理，使用*CIContext*来创建自己的渲染流

You can use an *AVVideoCompostion* object ot app Core Image filters to each frame of a video during playback or export.
通过调用*CIContext*类来管理资源。
By managing a Core Image context directly, you can precisely control your app's performance characteristics or integrate Core Image with lower-level rendering technologies.
*context*开销很大，如果想做一系列图片处理，需要尽快创建context，储存起来为以后重用。



