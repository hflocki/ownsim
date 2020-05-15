FROM hflocki/deb9
FROM mono/debian-9-amd64

RUN apt-get update \
	&& apt-get install -y curl \
	   apt-transport-https \
	   dirmngr \
	   gnupg \ 
	   mono-devel \ 
     ca-certificates-mono \
     fsharp \
     mono-vbnc \
     nuget \
     screen \
	&& rm -rf /var/lib/apt/lists/*

ADD startup.sh /
RUN chmod +x startup.sh

EXPOSE 8000/tcp
EXPOSE 9000/tcp
EXPOSE 8000/udp
EXPOSE 9000/udp

ENTRYPOINT ["/bin/bash"]
