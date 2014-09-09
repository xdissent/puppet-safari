class safari::develop_menu(
  $ensure = present,
){
  safari::pref { 'IncludeDevelopMenu':
    ensure => $ensure,
  }
}