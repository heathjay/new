FROM tudinfse/cds_server

COPY ./cds_server.json /etc/cds_server.json 


#11.04
#apt-install
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install make && \
	apt-get install g++ build-essential libssl-dev pkg-config -y



# Copy source code of the cds server into the build container
ADD ./cds_server /tmp/cds_server
ADD ./mopp-2018-t0-harmonic-progression-sum /tmp/mopp-2018-t0-harmonic-progression-sum
ADD ./mopp-2018-t1-average /tmp/mopp-2018-t1-average
ADD ./mopp-2018-t2-levenshtein /tmp/mopp-2018-t2-levenshtein


#19.05
RUN apt-get install golang -y

RUN export GOPATH=/tmp && \
	export PATH=$PATH:$GOPATH

#19.05
RUN apt-get install golang -y

RUN export GOPATH=/tmp/mopp-2018-t2-levenshtein
RUN export PATH=$PATH:$GOPATH

#12.04
#compile ccp

RUN	make -C /tmp/mopp-2018-t0-harmonic-progression-sum
#	./harmonic-progression-sum
RUN make -C /tmp/mopp-2018-t1-average/
RUN make -C /tmp/mopp-2018-t2-levenshtein/