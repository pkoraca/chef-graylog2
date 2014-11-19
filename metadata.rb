name             'graylog2'
maintainer       'Petar Koraca'
maintainer_email 'pkoraca@gmail.com'
license          'Apache'
description      'Installs/Configures graylog2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.1'

supports "centos"

depends "java"
depends "mongodb", "0.16.1"
depends "elasticsearch"
