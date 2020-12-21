---
title: "Xtract Classifier"
author: "Ryan Wong"
date: "2019-10-01"
slug: "xtract_classifier"
gh_repo: "https://github.com/rewong03/xtract-classifier"
---
The [Xtract Classifier](https://github.com/rewong03/xtract-classifier) is a 
machine learning tool that I developed as a research at [Globus Labs](https://labs.globus.org) 
under the mentorship of [Tyler Skluzacek](https://github.con/tskluzac). The 
Xtract Classifier is an experimental tool designed to categorize files, and 
is part of the greater [XtractHub](/projects/xtracthub) project.  
  
One of Xtract's main features is its ability to process heterogeneous data. 
It does so by using "extractors", which are programs hosted inside containers, 
which can be used to extract metadata from specific types of files. Some 
examples of extractors are [xtract-tabular](https://github.com/xtracthub/xtract-tabular) 
(which processes tabular data), [xtract-jsonxml](https://github.com/xtracthub/xtract-tabular) 
(which processes json/xml files), and [xtract-matio](https://github.com/xtracthub/xtract-tabular) 
(which processes materials science data). Not every extractor can extract 
metadata from each file, so it is costly to run every extractor on every 
file.  
  
In order to reduce the penalty of running incompatible extractors on files, 
Xtract utilizes machine learning to predict which extractors can be run on 
which files. Currently, Xtract uses an [incredibly simplistic](https://github.com/xtracthub/xtract-sampler/blob/master/train_model.py#L47) 
random forest model for classification, taking the first 500 bytes of a file 
as its parameters. This model produced [suspiciously accurate results](https://github.com/xtracthub/xtract-sampler/blob/master/model_results/rf-randhead-2019-07-14.json), 
training and testing in only **2** seconds while achieving an accuracy rate 
of **90+%**. Although there was nothing wrong with the random forest model, 
there was some curiousity to see if better results could be achieved using 
deep learning. There were also potential thoughts of utilizing transfer 
learning to increase the accuracy of future models.  
  
Similar to the random forest model, Xtract Classifier utilizes file bytes 
as parameters. Xtract Classifier then uses a convolutional 
neural network model for prediction. Multiple CNN models were developed 
for general scientific files and materials science files.  
  
While my work on the Xtract Classifier was a good start, it still pales 
in comparison to the original random forest model. In the future, some 
retrainable model will most likely need to be explored given Xtract's goal 
of processing heterogeneous data. However, I won't be touching any complex 
machine learning until I get a few linear algebra, stats, and ML classes 
under my belt. In the mean time, feel free to check it out [here](https://github.com/rewong03/xtract-classifier).
  
 
  
 
