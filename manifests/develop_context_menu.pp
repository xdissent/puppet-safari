class safari::develop_context_menu(
  $ensure = present,
){
  safari::pref { 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled':
    ensure => $ensure,
  }
}