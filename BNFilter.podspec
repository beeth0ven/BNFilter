Pod::Spec.new do |s|
s.name = "BNFilter"
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = "A Fliter View Controller"
s.homepage = "https://github.com/beeth0ven/BNFilter"
s.author = { "Luo Jie" => "beeth0vendev@gmail.com" }
s.source = { :git => "https://github.com/beeth0ven/BNFilter.git", :tag => "#{s.version}"}

s.platform = :ios
s.ios.deployment_target = '8.0'
s.requires_arc = true

s.source_files = "BNFilter/BNFilter/*.swift"
s.resources = "BNFilter/BNFilter/*.{storyboard}"

end
