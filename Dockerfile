FROM hflocki/deb9

RUN apt-get update \
	&& apt-get install -y curl \
	   apt-transport-https \
	   dirmngr \
	   gnupg \ 
	&& rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/debian stable-stretch/snapshots/5.18.0.225 main" > /etc/apt/sources.list.d/mono-xamarin.list \
	&& apt-get update \
	&& apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget screen \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 8000/tcp
EXPOSE 9000/tcp
EXPOSE 9002/tcp
EXPOSE 9003/tcp
EXPOSE 9005tcp
EXPOSE 8000/udp
EXPOSE 9000/udp
EXPOSE 9002udp
EXPOSE 9003udp
EXPOSE 9005udp

ENTRYPOINT ["/bin/bash"]
