Pod::Spec.new do |s|
  s.name             = 'AMPDynamicFont'
  s.version          = '0.1.0'
  s.summary          = 'Dynamic font for UILabel, UIButton, UITextField and UITextView'

  s.description      = <<-DESC
Dynamic font for UILabel, UIButton, UITextField and UITextView
                       DESC

  s.homepage         = 'https://github.com/alvaromurillo/AMPDynamicFont'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alvaromurillo' => 'hi@alvaromurillo.com' }
  s.source           = { :git => 'https://github.com/alvaromurillo/AMPDynamicFont.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'AMPDynamicFont/Classes/**/*'
  s.frameworks = 'UIKit'
end
