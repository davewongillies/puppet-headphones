class headphones::config {

    $headphones_data = "/usr/local/headphones-data"

    file { "/usr/local/headphones-data":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        recurse => 'true'
    }
    
    file { "/usr/local/headphones-data/settings.conf":
        content => template('headphones/settings.conf.erb'),
        owner => 'headphones',
        group => 'headphones',
        mode => '0644',
        require => File['/usr/local/headphones-data']
    }
    
}