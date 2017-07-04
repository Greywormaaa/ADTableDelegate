Pod::Spec.new do |s|
  s.name     = 'ADTableDelegate'
  s.version  = '0.0.2'
  s.license  = 'MIT'
  s.summary  = 'A table delegate framework.'
  s.homepage = 'https://github.com/heLooksLikeADog/ADTableDelegate'
  s.authors  = { 'qianZheng ma' => 'maqzeee@gmail.com' }
  s.source   = { :git => 'https://github.com/heLooksLikeADog/ADTableDelegate.git', :tag => s.version }
  s.requires_arc = true
  s.source_files = 'ADTableDelegate/AD*.{h,m}'
  s.platform     = :ios
  s.framework = 'UIKit'
end
