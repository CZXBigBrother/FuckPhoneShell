# 根据用户的手机壳来改变软件主题颜色解决方案
# 先看看网上别家的大神解决方案(太高端了 哈哈哈搞不定呀)
![73831533188946_.pic_hd.jpg](https://upload-images.jianshu.io/upload_images/3258209-8055006c646a673e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)
而且实际拿同事的眼睛做的过实验,感觉反光率好低
![2391533195450_.pic_hd.jpg](https://upload-images.jianshu.io/upload_images/3258209-040accb2363962f3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)
# 我的方案 :~)![WechatIMG7378.jpeg](https://upload-images.jianshu.io/upload_images/3258209-e93bf1d8d66631ef.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)
## 本来想获取图片的无数个点做一个渐变色,结果出来并不理想
## 看看失败的作品
![image.png](https://upload-images.jianshu.io/upload_images/3258209-2ca9fac0e0422324.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/250)
## wtf 什么鬼东西.....继续优化
![WechatIMG144.jpeg](https://upload-images.jianshu.io/upload_images/3258209-9667eb5260c72858.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/200)
![WechatIMG143.jpeg](https://upload-images.jianshu.io/upload_images/3258209-c103dffd6b78b7a6.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/200)
## 不行不行 什么鬼东西 ,果断放弃渐变效果
## 直接做纯色来试试
## 效果一
![73941533194947_.pic.jpg](https://upload-images.jianshu.io/upload_images/3258209-91ee4c32ce0443d3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/200)
![73951533194948_.pic.jpg](https://upload-images.jianshu.io/upload_images/3258209-127feceb9bca218c.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/200)
## 效果二
![73991533195110_.pic.jpg](https://upload-images.jianshu.io/upload_images/3258209-489d738129328b74.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/200)

![74001533195110_.pic.jpg](https://upload-images.jianshu.io/upload_images/3258209-7d78320eb14a8a58.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/200)
# 先说一下原理
把图片分割成10份,然后每隔一段距离获取一个点的色值,计算出平均值,作为背景色就好啦,如果还想做的准确一点,还可以获取更多点的值,把图片分割成更多份显示就可以了
![image.png](https://upload-images.jianshu.io/upload_images/3258209-4aa5c314962b4305.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/250)

# 嚯!!效果看起来出奇的好,所以产品经理再提这个需求................你还是应该弄死他!!!!!!!!弄死他!!!!!!!弄死他!!!!!!!

