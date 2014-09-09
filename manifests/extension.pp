# Type: safari::extension
#
# Usage:
#
#   safari::extension { 'octotree': # Must match bundle identifier
#     source: 'https://raw.githubusercontent.com/buunguyen/octotree/master/dist/safari.safariextz',
#   }
#
define safari::extension(
  $source,
  $id = $title,
) {
  require safari
  
  $path = "/Users/${::boxen_user}/Library/Safari/Extensions/${id}.safariextz"
  $helper = "${boxen::config::home}/safari-ext.app"
  $cache = "${boxen::config::cachedir}/safari/${id}.safariextz"

  exec { "/usr/bin/curl '${source}' -Lqo '${cache}'":
    creates => $cache,
    onlyif => "[ ! -f '${path}' ]"
  }
  ->
  exec { "safari-ext-${id}":
    command     => "open -W '${helper}' && sleep 2 && [ -f '${path}' ]",
    creates     => $path,
    environment => [
      "BOXEN_SAFARI_EXT_PATH=${cache}",
    ]
  }
}