
Pod::Spec.new do |s|



  s.name         = "LKToastTip"
  s.version      = "0.0.3"
  s.summary      = "最好用的吐司提示"


  s.description  = <<-DESC
                     最好用的吐司提示,支持代码和Storyboard两种初始化方式.
                   DESC

  s.homepage     = "https://github.com/KhunLam/LKToast"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = "MIT"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #


  s.author             = { "lamkhun" => "it-llk@top-ele.com.cn" }




  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.platform     = :ios
    s.ios.deployment_target = "8.0"



  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #


  s.source       = { :git => "https://github.com/KhunLam/LKToast.git", :tag => s.version }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "LKToastTip/*.{h,m}"



  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    s.resources = "LKToastTip/*.{png,xib,nib,bundle,strings}"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    s.framework  = "UIKit"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    s.requires_arc = true


end

