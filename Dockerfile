FROM debian:trixie

USER root

# Necessary packages for dependency installs
RUN apt-get update && apt-get install -y \
	build-essential \	
	git \
	wget

# Install wiringpi dependency
RUN wget https://github.com/WiringPi/WiringPi/releases/download/3.16/wiringpi_3.16_arm64.deb && \
	dpkg -i wiringpi_3.16_arm64.deb

#Install OpenPLC
RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git && \
	cd OpenPLC_v3 && \
	./install.sh docker

# Set the working directory
WORKDIR /OpenPLC_v3

# Expose the OpenPLC web interface port
EXPOSE 8080

# Run OpenPLC
CMD ["./start_openplc.sh"]



