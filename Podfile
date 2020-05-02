# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Espace_Collaboratif' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Espace_Collaboratif

   pod 'Alamofire', '~> 5.0.0-beta.7'
   pod 'PromisesSwift'
   pod 'SwiftyJSON'
   pod 'CRRefresh'
   pod 'Kingfisher'
   pod 'JitsiMeetSDK'
   pod 'BlueSocket'
   pod 'AppAuth'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end