class safari {
  include boxen::config

  file { "${boxen::config::home}/safari-ext.app":
    ensure  => directory,
    source  => 'puppet:///modules/safari/safari-ext.app',
    recurse => true,
  }

  $db     = '/Library/Application Support/com.apple.TCC/TCC.db'
  $sqlite = '/usr/bin/sqlite3'
  $app_id = 'com.xdissent.boxen.safari-ext'
  $svc    = 'kTCCServiceAccessibility'
  $insert = "INSERT OR REPLACE INTO access VALUES ('${svc}', '${app_id}', 0, 1, 0, NULL);"
  $select = "SELECT client FROM access WHERE allowed=1 AND client='${app_id}';"

  exec { 'safari-ext-accessibility':
    command => "${sqlite} '${db}' \"${$insert}\"",
    user    => 'root',
    unless  => "${sqlite} '${db}' \"${select}\" | grep -q '${app_id}'",
  }

  file { "${boxen::config::cachedir}/safari":
    ensure => 'directory',
  }

  Class['safari'] -> Safari::Extension <| |>
}
