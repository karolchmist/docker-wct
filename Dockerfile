FROM nodesource/trusty:latest

RUN apt-get update;

# install Chrome
RUN apt-get install -y curl
RUN curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# install Firefox 55
RUN apt-get install -y wget tar
RUN wget -O /usr/local/firefox-55.0.2.tar.bz2 https://download-installer.cdn.mozilla.net/pub/firefox/releases/55.0.2/linux-x86_64/fr/firefox-55.0.2.tar.bz2
RUN tar xvjf /usr/local/firefox-55.0.2.tar.bz2 -C /usr/local
RUN ln -s /usr/local/firefox/firefox /usr/bin/firefox

# install java; needed by selenium
RUN apt-get install -y default-jre

# install web-component-tester & bower globally
RUN npm install -g web-component-tester
RUN npm install -g bower

# configure bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc
