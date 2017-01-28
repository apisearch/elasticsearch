# Elasticsearch 5 for Golang apps

Default elasticsearch does not work with Golang projetcs. Added config which fixes this problem.

- GitHub: https://github.com/apisearch/elasticsearch
- Docker Hub: https://hub.docker.com/r/apisearch/elasticsearch/


#### Installed some additional things:

- ICU plugin
- Czech dictionary


## Native vs dockerized golang app

There is problem with Elasticsearch network settings when trying to connect from Golang app.
Here is settings which works for me:
 
### Running Golang app natively with dockerized ES
  
- GitHub branch of Elasticsearch: `develop`
- Docker tak of ES: `apisearch/elasticsearch:develop`
- expose port `9200` of ES container 
- Golang app connection config:
  
```golang
import "gopkg.in/olivere/elastic.v5"
client, err := elastic.NewClient(elastic.SetURL("http://localhost:9200"))
```
 
### Running Golang inside Docker container with dockerized ES
  
- GitHub branch of Elasticsearch: `master`
- Docker tak of ES: `apisearch/elasticsearch:latest`
- Golang app connection config (replace `elasticsearch` with name of your container):
  
```golang
import "gopkg.in/olivere/elastic.v5"
client, err := elastic.NewClient(elastic.SetURL("http://elasticsearch:9200"), elastic.SetSniff(false))
```
