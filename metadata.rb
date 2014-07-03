name             'graylog2'
maintainer       'Petar Koraca'
maintainer_email 'petar.koraca@gmail.com'
license          'Apache'
description      'Installs/Configures graylog2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports "centos"

depends "java"
depends "mongodb"
depends "elasticsearch"