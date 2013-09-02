include_recipe "sprout-osx-base::homebrew"

directory "/opt/homebrew-cask" do
  owner node['current_user']
end

directory "/opt/homebrew-cask/Caskroom" do
  owner node['current_user']
end

execute "tap phinze/homebrew-cask" do
  command "brew tap phinze/homebrew-cask"
  not_if { system("brew tap | grep 'cask' > /dev/null 2>&1") }
end

brew "brew-cask"
