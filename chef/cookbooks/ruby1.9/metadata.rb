maintainer        "Carlo Zottmann"
maintainer_email  "carlo@zottmann.org"
license           "WTFPL"
description       "Installs Ruby 1.9 from source"
long_description  "Installs Ruby 1.9 from source"
version           "1.0"
recipe            "ruby1.9", "Installs Ruby 1.9 from source."

%w( apt build-essential ).each do |d|
  depends d
end

%w{ ubuntu debian }.each do |os|
  supports os
end

