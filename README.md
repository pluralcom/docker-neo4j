# docker-neo4j
Plural's Docker Image for the [Neo4j Graph Database](https://neo4j.com/)

## Getting started
Documentation for the Neo4j image can be found [here](http://neo4j.com/docs/operations-manual/current/deployment/single-instance/docker/).

You can start a Neo4j container like this:

```
docker run \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
    pluralcom/neo4j:latest
```

## Why use this
- If you want a docker image with built in support for the supported features listed below. e.g.: To be used with [CircleCI](https://circleci.com)'s docker executor where you can't modify the volumes.

## What's included
- [APOC](https://github.com/neo4j-contrib/neo4j-apoc-procedures)


###### Built with ❤️ in California.
