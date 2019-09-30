#
# Be sure to run `pod lib lint LGLBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LGLBaseKit'
  s.version          = '0.0.6'
  s.summary          = 'LGLBaseKit is a convenient library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: A convenient library that encapsulates common UI controls and methods
                       DESC

  s.homepage         = 'https://github.com/liguoliangiOS/LGLBaseKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'ligl@chinamobiad.com'
  s.source           = { :git => 'https://github.com/liguoliangiOS/LGLBaseKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version =  '5.0'
  # s.source_files = 'LGLBaseKit/Classes/**/*'

  # s.resource_bundles = {
  #   'LGLBaseKit' => ['LGLBaseKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.subspec 'LGLExtension' do |ss|
    ss.source_files = 'LGLBaseKit/Classes/LGLExtension'
  end
  
  s.subspec 'LGLCrypt' do |ss|
    ss.source_files = 'LGLBaseKit/Classes/LGLCrypt'
  end
  
  s.subspec 'LGLDeviceInfo' do |ss|
    ss.source_files = 'LGLBaseKit/Classes/LGLDeviceInfo'
  end
  
  s.subspec 'LGLAlert' do |ss|
    ss.source_files = 'LGLBaseKit/Classes/LGLAlert'
  end
  
  s.subspec 'LGLPublicMethod' do |ss|
    ss.source_files = 'LGLBaseKit/Classes/LGLPublicMethod'
  end
    
end
