class supervisor::update (
  $ignore = false,
) {
  if $ignore {
    $cmd = '/bin/true'
  } else {
    $cmd = '/usr/bin/supervisorctl update'
  }

  exec { 'supervisor::update':
    command     => $cmd,
    logoutput   => on_failure,
    refreshonly => true,
    noop        => $ignore,
    require     => Service[$supervisor::params::system_service],
  }
}
