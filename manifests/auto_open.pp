class safari::auto_open(
  $ensure = present,
){
  safari::pref { 'AutoOpenSafeDownloads':
    ensure => $ensure,
  }
}