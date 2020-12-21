---
title: "XtractHub"
author: "Ryan Wong"
date: "2019-06-01"
slug: "xtracthub"
language: "Python"
---
[XtractHub](https://github.com/xtracthub) is a project that I contributed to as part of the 
[2019 CDAC Summer Lab](https://cdac.uchicago.edu/engage/summerlab/#project-profiles) under 
the mentorship of [Tyler Skluzacek](https://github.com/tskluzac). Xtract is a service that 
extracts metadata from heterogeneous scientific file formats, and is a project from 
[Globus Labs](https://labs.globus.org).  
  
As advancements in scientific computing have been made, the volume and variety of data 
produced by experiments have increased significantly. Most of this scientific data is stored 
in public/shared repositories such as [Petrel](https://petrel.alcf.anl.gov). However, due 
to the inability to effectively and fully describe files, much of that data becomes unkempt 
and unusable by other scientists and users, defeating the purpose of shared repositories 
and hampering scientific discovery.  
  
To combat this issue, Xtract extracts metadata properties from files, which can later be 
searched and queried by users. Examples of metadata properties include averages from 
tabular data, keywords in text files, or locations on map images. The two main issues that 
Xtract faces when attempting to process scientific repositories is the size and heterogeneity 
of data. To combat the issue of scale, Xtract processes data in a distributed manner, 
operating on hardware such as [ANL](https://en.wikipedia.org/wiki/Argonne_National_Laboratory)'s 
supercomputers or on [AWS Elastic Beanstalk](https://aws.amazon.com/eb/). To combat the issue 
of heterogeneity, Xtract utilizes [containers](https://en.wikipedia.org/wiki/OS-level_virtualization) 
to host various data processing functions.  
  
Before Xtract extracts metadata from files, it first uses a machine learning model (called 
the [xtract-sampler](https://github.com/xtracthub/xtract-sampler)) to predict what types of 
metadata can be extracted from each file. Doing so reduces any additional computation that 
would occur from attempting to extract non-existant metadata from a file. Xtract then 
"extractors", which are data processing functions, to extract metadata from specific types of 
files. Some examples of extractors are [xtract-tabular](https://github.com/xtracthub/xtract-tabular) 
(which processes tabular data), [xtract-jsonxml](https://github.com/xtracthub/xtract-tabular) 
(which processes json/xml files), and [xtract-matio](https://github.com/xtracthub/xtract-tabular) 
(which processes materials science data). One of the unique aspects of Xtract is that in the 
future, users will be able to submit their own extractors, allowing them to utilize Xtract 
to fit their own needs. Finally, Xtract then takes the metadata returned by the extractors 
and stores it.  

{{< figure src="/images/projects/xtracthub/xtracthub_arch.png" width=800 caption="XtractHub Architecture" >}}  
  
During my research assistantship, I mainly worked on developing extractors. I began by 
adding documentation and increasing the clarity of the extractors. Then, I optimized and 
increased the capabilities of some of the extractors, such as the [json/xml extractor](https://github.com/xtracthub/xtract-jsonxml) 
and the [tabular extractor](https://github.com/xtracthub/xtract-tabular) and developed some 
new extractors, such as the [keyword extractor](https://github.com/xtracthub/xtract-keyword) 
and the [materials science file extractor](https://github.com/xtracthub/xtract-matio) (built 
on [MaterialsIO](https://github.com/materials-data-facility/MaterialsIO)). For all extractors, 
I also created Dockerfiles so that they could be built into [Docker containers](https://www.docker.com/resources/what-container), 
allowing them to be fully utilized in Xtract. Additionally, I made substantial improvements 
to Xtract's [file sampler](https://github.com/xtracthub/xtract-sampler), which uses machine 
learning to determine what metadata can be extracted from each file. I improved the accuracy 
of the model, automated the training of the model, and did some overall cleanup. I also made 
a Python Flask web application that served as a mini version of Xtract that extracted metadata 
from individual files rather than entire data repositories.

Near the end of my assistantship, I helped co-author "Serverless Workflows for Indexling 
Large Scientific Data", where Xtract was used to process data from the [Materials Data Facility](https://materialsdatafacility.org) 
(MDF). MDF is a public repository of materials science data, hosting millions of various 
materials science files from numerous users.
  
{{< figure src="/images/projects/xtracthub/mdf_treemap.jpg" width=1000 caption="Treemap of file extensions from 2.2 million MDF files" >}}
  
In our experiment, Xtract was used to process a ~2 million file subset of MDF, successfully
extracting metadata from ~250,000 files.  

{{< figure src="/images/projects/xtracthub/extractor_performance.png" width=800 caption="Extractor performance on MDF" >}}
  
Since the summer of 2019, I have continued to work on XtractHub. Click [here](/projects/xtract_classifier) 
to read about the Xtract Classifier, an attempt to classify files using deep learning, or 
click [here](/projects/xtract_container_service) to read about the Xtract Container Service, 
a system for managing and building containers.
