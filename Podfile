# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'


def commoms
  pod "Alamofire"
end

def tests
  pod 'Quick'
  pod "Nimble"
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

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
  end
end
