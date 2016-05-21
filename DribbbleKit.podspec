Pod::Spec.new do |s|
  s.name         = "DribbbleKit"
  s.version      = "0.0.2"
  s.summary      = "Swift wrapper of Dribbble API"
  s.homepage     = "https://github.com/CaptainTeemo/DribbbleKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Captain Teemo" => "chriswoody05@icloud.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/CaptainTeemo/DribbbleKit.git", :tag => s.version.to_s }
  s.source_files = "DribbbleKit", "Classes/**/*.{h,Swift}"
  s.requires_arc = true
end
