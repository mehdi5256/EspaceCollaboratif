#platform :ios, '13.2'

workspace 'EspaceCollaboratif.xcworkspace'

target 'EspaceCollaboratif' do
  project 'EspaceCollaboratif.xcodeproj'
    use_frameworks!


  pod 'JitsiMeetSDK'
  pod 'BlueSocket'
  pod 'SwiftyJSON' 
  pod 'Alamofire'
  pod 'Promises'
  pod 'AlamofireImage'
  pod 'AppAuth'


end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
  end
end
