user_list = node[:user_list]

user_list.each do |name, values|
  group "#{name}" do
    gid values[:uid]
  end

  user "#{name}" do
    uid values[:uid]
    gid name
    home values[:home]
    shell values[:shell]
  end

  directory "#{values[:home]}" do
    owner name
    group name
    mode "755"
  end

  directory "#{values[:home]}/.ssh" do
    owner name
    group name
    mode "700"
  end

  template "#{values[:home]}/.ssh/authorized_keys" do
    source "authorized_keys.erb"
    owner name
    group name
    variables :pkey => values[:pkey]
  end

  if values[:admin]
    execute "Adding #{name} to admin group" do
      user "root"
      command "usermod -a -G admin #{name}"
    end
  end
end
