Pod::Spec.new do |s|
  s.name             = 'ZippyJSON'
  s.version          = '1.2.3'
  s.summary          = 'A ~4x faster, drop-in replacement for JSONDecoder'

  s.description      = <<-DESC
ZippyJSON is a very fast library for converting JSON into Swift objects. It is feature-complete, so just use s/JSONDecoder/ZippyJSONDecoder to incorporate it into your app.
                       DESC

  s.homepage         = 'https://github.com/michaeleisel/ZippyJSON'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'michaeleisel' => 'michael.eisel@gmail.com' }
  s.source           = { :git => 'https://github.com/michaeleisel/ZippyJSON.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'

  s.source_files = 'Sources/**/*.{h,hh,mm,m,c,cpp,swift}'
  s.dependency 'ZippyJSONCFamily', '1.2.3'
  s.dependency 'JJLISO8601DateFormatter', '0.1.4'
  s.swift_version = '5.0'

  s.test_spec 'Tests' do |test_spec|
    # test_spec.requires_app_host = true
    test_spec.source_files = 'Tests/**/*.{swift,h,m}'
    test_spec.resources = 'Tests/**/*.json'
  end
end
