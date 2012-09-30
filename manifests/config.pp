class headphones::config {

    $headphones_data = "/usr/local/headphones-data"

    file { "/usr/local/headphones-data":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        recurse => 'true'
    }
}