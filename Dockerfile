FROM index.alauda.cn/library/centos:7
RUN yum install -y epel-release
RUN yum install -y wget make gcc
RUN wget http://www.cpan.org/src/5.0/perl-5.22.1.tar.gz
RUN tar -xzf perl-5.22.1.tar.gz
RUN cd perl-5.22.1 && ./Configure -des -Dprefix=$HOME/localperl
RUN cd perl-5.22.1 && make && make test && make install
RUN chmod +x /root/localperl/bin/perl
RUN ln -s /root/localperl/bin/perl /usr/bin/perl
#RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN wget http://xrl.us/cpanm -O /usr/bin/cpanm && chmod +x /usr/bin/cpanm
RUN yum install -y openssl openssl-lib openssl-devel
RUN cpanm -v Mojo::Webqq
ADD main.pl main.pl
RUN cpanm -v MIME::Lite
RUN cpanm -v Mojo::SMTP::Client
CMD ["perl","main.pl"]
