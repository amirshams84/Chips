FROM centos:latest
MAINTAINER Amir Shams <amir.shams84@gmail.com>
ENV ROOT=/
ENV CURRENT_PATH=/
##############################################################
# Dockerfile Version:   1.0
# Software:             centos7
# Software Version:     7.0
# Software Website:     https://www.centos.org/
# Description:          Centos7
##############################################################

RUN yum -y update ;
RUN yum clean all ;
RUN yum install -y epel-release ;
RUN yum install -y ansible git gcc gcc-c++ make net-tools sudo which wget file patch libtool texinfo tar unzip bzip2 bzip2-devel ; 
RUN yum install -y openssl openssl-devel readline readline-devel sqlite-devel tk-devel zlib zlib-devel ncurses-devel python-pip mc ;
RUN yum install -y tbb ;
RUN yum clean all ;
##############################################################
# Software:             PIP INSTALL PACKAGES
# Software Version:     1.0
# Software Website:     -
# Description:          required javascript library
##############################################################
ENTRYPOINT ["/bin/bash"]
RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install scipy
RUN pip install plotly
RUN pip install pandas
#RUN pip install biom-format
RUN pip install xlrd
RUN pip install openpyxl
RUN pip install xlwt
RUN pip install XlsxWriter
RUN pip install lxml
RUN pip install zip
##############################################################
# Software:             Regular
# Software Version:     1.0
# Software Website:     -
# Description:          required javascript library
##############################################################

ENTRYPOINT ["/bin/bash"]
RUN mkdir /INPUTDIR /EXECDIR /OUTPUTDIR /TESTDIR /INDEXDIR
RUN chmod -R 0755 /INPUTDIR /EXECDIR /OUTPUTDIR /TESTDIR /INDEXDIR

##############################################################
# Dockerfile Version:   1.0
# Software:             mothur
# Software Version:     1.39
# Software Website:     www.mothur.org
# Description:          mothur 
##############################################################

RUN wget https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip -P /EXECDIR
RUN unzip /EXECDIR/Mothur.linux_64.zip -d /EXECDIR
RUN rm -rf /EXECDIR/Mothur.linux_64.zip /EXECDIR/__MACOSX
RUN chmod -R 0755 /EXECDIR/mothur

##############################################################
# Dockerfile Version:   1.0
# Software:             bowtie
# Software Version:     1.2
# Software Website:     bowtie
# Description:          bowtie 
##############################################################

RUN mkdir /EXECDIR/bowtie
RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.0/bowtie-1.2-linux-x86_64.zip -P /EXECDIR/bowtie
RUN unzip /EXECDIR/bowtie/bowtie-1.2-linux-x86_64.zip -d /EXECDIR/bowtie
RUN rm -rf /EXECDIR/bowtie/bowtie-1.2-linux-x86_64.zip
RUN chmod -R 0755 /EXECDIR/bowtie/bowtie-1.2

##############################################################
# Dockerfile Version:   1.0
# Software:             ChIps
# Software Version:     1.0
# Software Website:     
# Description:          ChIps python workflow
##############################################################

RUN wget https://raw.githubusercontent.com/amirshams84/Chips/master/chips.py -P /

ENTRYPOINT ["/bin/bash"]
