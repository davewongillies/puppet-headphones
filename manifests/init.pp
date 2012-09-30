class headphones( $source = 'true' ) {
    
    $url = "https://github.com/rembo10/headphones.git"
    
    include headphones::config
    
    user { 'headphones':
        allowdupe => false,
        ensure => 'present',
        uid => '603',
        shell => '/bin/bash',
        gid => '603',
        home => '/home/headphones',
        password => '*',
    }
    
    group { "headphones":
        allowdupe => false,
        ensure => present,
        gid => 603,
        name => 'headphones',
        before => User["headphones"]
    }

    file { '/home/headphones':
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        mode => '0644',
    }
    
    exec { 'download-headphones':
        command => "/usr/bin/git clone $url headphones",
        cwd     => '/usr/local',
        creates => "/usr/local/headphones",
    }
    
    file { "/usr/local/headphones":
        ensure => directory,
        owner => 'headphones',
        group => 'headphones',
        mode => '0644',
    }

    file { "/etc/init.d/headphones":
        content => template('headphones/init-rhel.erb'),
        owner => 'root',
        group => 'root',
        mode => '0755',
    }  
}
