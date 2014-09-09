class safari::bookmarks_bar(
  $ensure = present,
){
  safari::pref { 'ShowFavoritesBar':
    ensure => $ensure,
  }
}