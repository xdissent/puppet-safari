class safari::status_bar(
  $ensure = present,
){
  safari::pref { 'ShowStatusBar':
    ensure => $ensure,
  }
}