#
# Be sure to run `pod lib lint AzureNotificationHubClient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AzureNotificationHubClient"
  s.version          = "0.1.0"
  s.summary          = "A pure Swift client for the Azure notification hub API."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
A pure Swift client for the Azure notification hub API.
                       DESC

  s.homepage         = "https://github.com/mnespor/AzureNotificationHubClient"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'Apache 2.0'
  s.author           = { "mnespor" => "horizon.five.software@gmail.com" }
  s.source           = { :git => "https://github.com/mnespor/AzureNotificationHubClient.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/technespor'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AzureNotificationHubClient' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
