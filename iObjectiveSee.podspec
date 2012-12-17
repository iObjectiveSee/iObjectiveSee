Pod::Spec.new do |s|
  s.name         = "iObjectiveSee"
  s.version      = "0.0.3"
  s.summary      = "A repository of common, useful extensions to several default Apple classes."
  s.homepage     = "http://github.com/iObjectiveSee"
	s.licence      = 'MIT'
	s.author       = { "Sarah Lensing" => "sarahlensing@gmail.com" }
  s.source       = { :git => "https://github.com/iObjectiveSee/iObjectiveSee.git", :tag => "0.0.3" }
  s.platform     = :ios
  s.source_files = 'iObjectiveSee.h', 'iObjectiveSee/Extensions/*.{h,m}', 'iObjectiveSee/ViewControllers/*.{h,m}'
  s.frameworks = 'CoreGraphics', 'QuartzCore', 'CoreFoundation'
end
