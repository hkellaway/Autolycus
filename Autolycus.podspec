Pod::Spec.new do |s|
  s.name             = "Autolycus"
  s.version          = "0.1.0"
  s.summary          = "Autolayout DSL for writing layout and constraints programmatically"
  s.description      = "Autolayout DSL for writing layout and constraints programmatically."
  s.homepage         = "https://github.com/hkellaway/Autolycus"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Harlan Kellaway" => "hello@harlankellaway.com" }
  s.source           = { :git => "https://github.com/hkellaway/Autolycus.git", :tag => s.version.to_s }
  
  s.platforms     = { :ios => "10.0" }
  s.requires_arc = true

  s.source_files     = 'Sources/*.{swift}'

end
