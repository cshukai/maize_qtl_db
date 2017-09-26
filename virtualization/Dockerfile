FROM maizeqtldb:latest
MAINTAINER Shu-Kai Chang<sc724@mail.missouri.edu>
RUN wget -r  --no-parent ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/plant/Zea_mays/latest_assembly_versions/GCA_000005005.6_B73_RefGen_v4/*.gz
RUN pip install pdftabextract
RUN pip install docker-compose
RUN git clone https://github.com/cmdcolin/manytracks.git
RUN mv manytracks ManyTracks
RUN git clone https://github.com/cmdcolin/manytracks.git
RUN apt-get install libfontconfig1 libfontconfig1-dev
RUN wget --no-check-certificate https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf  phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN apt-get install curl
RUN apt-get install gnupg
RUN curl -sL https://deb.nodesource.com/setup_8.x |  bash -
RUN apt-get install nodejs
RUN git clone https://github.com/d3-node/d3node-barchart.git
RUN npm install d3-node
RUN npm install d3node-barchart