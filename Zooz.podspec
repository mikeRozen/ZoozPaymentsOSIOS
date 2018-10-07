
Pod::Spec.new do |s|

  s.name         = "Zooz"
  s.version      = "0.0.1"
  s.summary      = "IOS conector for ZoozPaymentOS API"
  s.description  = <<-DESC
    IOS connector for Zooz PaymentsOS API
                   DESC

  s.homepage     = "https://github.com/mikeRozen/ZoozPaymentsOSIOS"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Michael Rozenblat" => "mike.rozen1@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/mikeRozen/ZoozPaymentsOSIOS.git", :tag => '0.1' }
  s.source_files  = 'Zooz/**/*'
  s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

end
