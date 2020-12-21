---
title: "Xtract Container Service"
author: "Ryan Wong"
date: "2019-12-01"
slug: "xtract_container_service"
language: "Python"
---
The [Xtract Container Service (XCS)](https://github.com/xtracthub/xtract-container-service) is 
a service I developed as a research assistant at [Globus Labs](https://labs.globus.org) under 
the mentorship of [Tyler Skluzacek](https://github.com/tskluzac). XCS is a service for building 
and storing containers (the [computing kind](https://en.wikipedia.org/wiki/OS-level_virtualization), 
not the [storage kind](https://en.wikipedia.org/wiki/Container)), and is part of the greater 
[XtractHub](/projects/xtracthub) project.  
  
Xtract's main feature is its ability to process heterogeneous data in a scalable manner. To do 
so, it uses [FuncX](https://funcx.org), which utilizes containers, allowing for the large-scale 
execution of various functions on the same computing device. Before Xtract and FuncX can run 
containers on data, those containers must be built and stored, which is CPU and IO intensive. 
Due to the number of containers to be used in Xtract, XCS was created to reliably build and 
store containers for later use in Xtract.  
  
To utilize XCS, a user first submits a [Docker](https://www.docker.com) or [Singularity](https://sylabs.io/docs/) 
configuration file, describing the parameters of the container to be built. XCS then stores 
this configuration in [AWS S3](https://aws.amazon.com/s3/) for later reference and creates 
entries within an [AWS RDS Postgres](https://aws.amazon.com/rds/) database containing metadata 
on the user and configuration. 
  
Then, XCS begins the container building process. XCS places the job within an [AWS SQS Queue](https://aws.amazon.com/sqs/), 
where it is later pulled down and processed in parallel along with other containers. As the 
container is being built, a respective Postgres entry is updated, allowing users to query 
their build status. Once the build it complete, it is then pushed to AWS S3 or [AWS ECR](https://aws.amazon.com/ecr/) 
for long-term storage. Users can then pull down their containers through XCS. All users are 
verified using [Globus Auth](https://docs.globus.org/api/auth/specification/), an OAuth-2 
authentication method, to ensure that containers can only be accessed by users who uploaded 
the respective configuration file.
  
Currently, I am not working on XCS, but I fully intend to resume its development in the near 
future. One large area of development that needs to be completed is deploying XCS using 
[AWS EB](https://aws.amazon.com/eb/). I previously attempted to do so but found difficulties 
regarding installing all of the necessary tools and restructuring XCS to fit the EB format. 
Another area I would like to develop is the extensibility of XCS. I would like to switch XCS to 
a more object-oriented design, allowing for the addition of new container formats. Since 
containers are so widely used, this could allow XCS to be utilized in the building/storing of 
containers for other projects. 
