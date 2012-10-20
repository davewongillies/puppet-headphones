class headphones::config {

    $headphones_data = "/usr/local/headphones-data"
    $headphones_port = extlookup("headphones_port")
    $sabnzbd_host = extlookup("sabnzbd_host")
    $sabnzbd_root = extlookup("sabnzbd_root")
    $sabnzbd_apikey = extlookup("sabnzbd_apikey")

    file { "/usr/local/headphones-data":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        recurse => 'true'
    }

    file { "/usr/local/headphones-data/config.ini":
        content => template('headphones/config.ini.erb'),
        owner => 'headphones',
        group => 'headphones',
        mode => '0644',
        require => File['/usr/local/headphones-data']
    }
}