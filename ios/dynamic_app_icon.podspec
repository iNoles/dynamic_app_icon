Pod::Spec.new do |s|
  s.name             = 'dynamic_app_icon'
  s.version          = '0.0.1'
  s.summary          = 'A plugin to change the app icon dynamically.'

  s.description      = <<-DESC
A Flutter plugin to change the app icon dynamically, including support for alternate icons.
  DESC

  s.homepage         = 'https://github.com/iNoles/dynamic_app_icon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jonathan Steele' => 'xfsunoles@gmail.com' }
  s.source           = { :git => 'https://github.com/iNoles/dynamic_app_icon.git', :tag => s.version.to_s }
  s.platform         = :ios, '11.0'

  s.source_files = 'dynamic_app_icon/Sources/dynamic_app_icon/*.swift'
  s.dependency       'Flutter'
end
