# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'


def commoms
  pod "Alamofire"
  pod "Kingfisher"
end

def tests
  pod 'Quick'
  pod 'Nimble'
  pod "KIF"
  pod "iOSSnapshotTestCase"
end

target 'StarsTop' do
  use_frameworks!
  commoms
  
  target 'StarsTopTests' do
    inherit! :search_paths
    tests
  end
  
end
