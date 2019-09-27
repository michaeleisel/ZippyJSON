#
# Be sure to run `pod lib lint JJLISO8601DateFormatter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JJLISO8601DateFormatter'
  s.version          = '0.1.2'
  s.summary          = 'A 10x+ faster drop-in replacement for NSISO8601DateFormatter'

  s.description      = <<-DESC
'JJLISO8601DateFormatter is a 10x+ faster drop-in replacement for NSISO8601DateFormatter. It provides efficient, ISO 8601 compliant, date formatting.'
                       DESC

  s.homepage         = 'https://github.com/michaeleisel/JJLISO8601DateFormatter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Eisel' => 'michael.eisel@gmail.com' }
  s.source           = { :git => 'https://github.com/michaeleisel/JJLISO8601DateFormatter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'

  s.source_files = 'Sources/JJLISO8601DateFormatter/**/*'
  s.public_header_files = 'Sources/JJLISO8601DateFormatter/include/JJLISO8601DateFormatter.h'

  # s.requires_arc = false # todo: put back in later
end
