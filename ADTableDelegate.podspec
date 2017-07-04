Pod::Spec.new do |s|
  s.name     = 'ADTableDelegate'
  s.version  = '0.0.3'
  s.license  = 'MIT'
  s.summary  = 'A table delegate framework.'
  s.homepage = 'https://github.com/heLooksLikeADog/ADTableDelegate'
  s.authors  = { 'qianZheng ma' => 'maqzeee@gmail.com' }
  s.source   = { :git => 'https://github.com/heLooksLikeADog/ADTableDelegate.git', :commit => '0cf427896409db849009f375a672e00aff807555', :tag => s.version }
  s.requires_arc = true
  s.source_files = 'ADTableDelegate/*.{h,m}'
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.framework = 'UIKit'
end
