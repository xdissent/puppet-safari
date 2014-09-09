class safari::debug_menu(
  $ensure = present,
){
  safari::pref { 'IncludeInternalDebugMenu':
    ensure => $ensure,
  }
}