#
# Be sure to run `pod lib lint ZippyJSON.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZippyJSON'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ZippyJSON.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/michaeleisel/ZippyJSON'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'michaeleisel' => 'michael.eisel@gmail.com' }
  s.source           = { :git => 'https://github.com/michaeleisel/ZippyJSON.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'

  s.source_files = 'Sources/**/*.{h,hh,mm,m,c,cpp,swift}'
  s.dependency 'ZippyJSONCFamily'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/*.{swift,h,m}'
  end
end
