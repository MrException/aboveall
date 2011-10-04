# Paperclip config

Paperclip.options[:command_path] = "/usr/bin"

Paperclip::Attachment.default_options.update({
  path: ":rails_root/public/system/:class/:attachment/:hash/:style.:extension",
  url: "/system/:class/:attachment/:hash/:style.:extension",
  hash_secret: "0GALvjck9gMYTvQkH40bfSgraVHZC0/nHoHQQo0cu5Y7qBtKUlsfs5y+H1OlVIJ4GmBx7577l9TCzBSE2G16Ohqs6DnjZZWvB9B7d83WglM8ps/o+R17hVv6hRpk/p3XZFK2tjfbLB78QMQw7p2/a+cMvtE/f92wmCZzyhtlJl8="
})
