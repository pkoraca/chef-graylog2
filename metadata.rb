name             'graylog2'
maintainer       'Petar Koraca'
maintainer_email 'pkoraca@gmail.com'
license          'Apache'
description      'Installs/Configures graylog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.2'

supports "centos"

depends "java"
depends "mongodb", "0.16.1"
depends "elasticsearch", "0.3.13"
