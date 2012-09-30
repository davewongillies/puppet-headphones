class headphones::config {

    $headphones_data = "/usr/local/headphones-data"
    $headphones_port = extlookup("headphones_port")

    file { "/usr/local/headphones-data":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        recurse => 'true'
    }
}