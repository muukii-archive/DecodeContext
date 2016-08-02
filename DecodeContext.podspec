#
# Be sure to run `pod lib lint JSONBridge.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DecodeContext'
  s.version          = '0.1.0'
  s.summary          = 'Swift <-> JSON (SwiftyJSON)'
  s.homepage         = 'https://github.com/muukii/DecodeContext'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'muukii' => 'm@muukii.me' }
  s.source           = { :git => 'https://github.com/muukii/DecodeContext.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/muukii0803'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.2'
  s.source_files = 'DecodeContext/Classes/**/*'
end
