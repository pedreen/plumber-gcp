FROM trestletech/plumber
MAINTAINER Pedro H Moreira (pedro@4intelligence.com.br)
WORKDIR /payload/
COPY [".","./"]
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y libcurl4-openssl-dev \
	libssl-dev \
	libxml2-dev \
	make


EXPOSE 9000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=9000)"]
CMD ["api.R"]
