FROM maizeqtldb:latest
MAINTAINER Shu-Kai Chang<sc724@mail.missouri.edu>
RUN wget -r  --no-parent ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/plant/Zea_mays/latest_assembly_versions/GCA_000005005.6_B73_RefGen_v4/*.gz
RUN pip install pdftabextract
RUN pip install docker-compose
RUN git clone https://github.com/cmdcolin/manytracks.git
RUN mv manytracks ManyTracks