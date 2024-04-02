FROM kalilinux/kali-rolling

COPY . /opendetect

# Install opendetect dependencies.
RUN apt-get update
RUN apt-get install -y \
        cewl \
        curl \
        davtest \
        dirb \
        dnsrecon \
        dnsutils \
        enum4linux \
        exploitdb \
        finger \
        git \
        hydra \
        ike-scan \
        metasploit-framework \
        nbtscan \
        netcat-openbsd \
        nfs-common \
        nikto \
        nmap \
        ntp \
        oscanner \
        python2 \
        python3 \
        python3-ldapdomaindump \
        python3-pip \
        smbclient \
        smbmap \
        snmp \
        sqlmap \
        sslscan \
        sslyze \
        wafw00f \
        whatweb

# Start the installation phase.
RUN cd opendetect/git/ && ./install.sh

WORKDIR /opendetect
CMD /usr/bin/python3 opendetect.py
