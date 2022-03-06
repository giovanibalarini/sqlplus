FROM i386/ubuntu

RUN apt-get update && \
    apt-get install alien wget -y

RUN wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-basic-linux.rpm && \
    wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-sqlplus-linux.rpm && \
    wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-tools-linux.rpm && \
    alien -i oracle-instantclient-basic-linux.rpm && \
    alien -i oracle-instantclient-tools-linux.rpm && \
    alien -i oracle-instantclient-sqlplus-linux.rpm && \
    apt-get install libaio1 && \
    echo "/usr/lib/oracle/21/client/lib/" > /etc/ld.so.conf.d/oracle.conf && \
    ldconfig && \
    rm oracle-instantclient-basic-linux.rpm && \
    rm oracle-instantclient-tools-linux.rpm && \
    rm oracle-instantclient-sqlplus-linux.rpm

ENTRYPOINT [ "/bin/bash" ]