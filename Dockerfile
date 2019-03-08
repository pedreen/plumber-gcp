FROM trestletech/plumber


RUN mkdir /data
COPY api.R /data
WORKDIR /data

EXPOSE 9000 

ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/data/api.R'); \
    pr$run(host='0.0.0.0', port=9000)"]

