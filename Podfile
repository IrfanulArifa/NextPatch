# Uncomment the next line to define a global platform for your project
# platform :ios, '16.0'

use_frameworks!
workspace 'NextPatch'

target 'NextPatch' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NextPatch
  pod 'SnackBar.swift'
  pod 'SDWebImage'
  pod 'Swinject'

  target 'NextPatchTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

# Module Game
target 'Game' do
  use_frameworks!
  project './Game/Game'
end