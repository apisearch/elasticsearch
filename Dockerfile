FROM elasticsearch:5.0.2

RUN bin/elasticsearch-plugin install analysis-icu

COPY config config/

