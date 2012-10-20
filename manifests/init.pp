class headphones {
    
    $url = "https://github.com/rembo10/headphones.git"
    $headphones_port = extlookup("headphones_port")
    
    include headphones::config
    
    user { 'headphones':
        allowdupe => false,
        ensure => 'present',
        uid => '603',
        shell => '/bin/bash',
        gid => '700',
        home => '/home/headphones',
        password => '*',
    }

    file { '/home/headphones':
        ensure => directory,
        owner => 'headphones',
        group => 'automators',
        mode => '0644',
        recurse => 'true'
    }
    
    exec { 'download-headphones':
        command => "/usr/bin/git clone $url headphones",
        cwd     => '/usr/local',
        creates => "/usr/local/headphones",
    }
    
    file { "/usr/local/headphones":
        ensure => directory,
        owner => 'headphones',
        group => 'automators',
        mode => '0644',
        recurse => 'true'
    }

    file { "/etc/init.d/headphones":
        content => template('headphones/init-rhel.erb'),
        owner => 'root',
        group => 'root',
        mode => '0755',
    }  
}
