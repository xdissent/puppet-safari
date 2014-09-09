define safari::pref(
  $ensure = present,
){
  $enable = $ensure ? {
    present => 'true',
    absent  => 'false',
  }
  boxen::osx_defaults { "safari-pref-${title}":
    ensure  => present,
    domain  => 'com.apple.Safari',
    key     => $title,
    value   => $enable,
    type    => 'bool',
    user    => $::boxen_user
  }
}