FROM elasticsearch:5.1.2-alpine

RUN bin/elasticsearch-plugin install analysis-icu

COPY config config/
