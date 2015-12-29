FROM index.alauda.cn/library/perl:5.20
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm -v Mojo::Webqq
RUN cpanm -v MIME::Lite
RUN cpanm -v Mojo::SMTP::Client
ADD load-plugin.pl load-plugin.pl
CMD ["perl", "load-plugin.pl"]
