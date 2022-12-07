platform :ios, '12.0'

target 'challenge-thefork' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire', '~> 5.6'
  pod 'AlamofireImage', '~> 4.1'

  target 'challenge-theforkTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'challenge-theforkUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if `arch`.include? "arm64"
          # Needed for building for simulator on M1 Macs
          config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
      end
    end
  end
end
