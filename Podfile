# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def installAlamofire 
   pod 'Alamofire'
end

target 'MyAnimeApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MyAnimeApp
  installAlamofire

  target 'MyAnimeAppTests' do
    inherit! :search_paths
    # Pods for testing
    installAlamofire
  end

  target 'MyAnimeAppUITests' do
    # Pods for testing
  end

end
