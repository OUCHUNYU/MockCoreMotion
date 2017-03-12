Pod::Spec.new do |s|
  s.name         = "MockCoreMotion"
  s.version      = "0.0.1"
  s.summary      = "A mock of CoreMotion API for developers to test their CoreMotion related code."
  s.homepage     = "https://github.com/OUCHUNYU/MockCoreMotion"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Chunyu Ou" => "http://ouchunyu.github.io/" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "git@github.com:OUCHUNYU/MockCoreMotion.git", :tag => "#{s.version}" }
  s.source_files = "MockCoreMotion/**/*.{swift}"
  s.frameworks   = "CoreMotion"
  s.requires_arc = true
end
