FROM index.alauda.cn/library/perl:5.20
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm -v Mojo::Webqq
ADD Mojo-Webqq Mojo-Webqq
RUN cpanm -v MIME::Lite
RUN cpanm -v Mojo::SMTP::Client
CMD ["perl", "Mojo-Webqq/demo/load-plugin.pl"]
