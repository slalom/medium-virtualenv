
# Reproducible Data Science Environment with virtualenv
 
### James Meadow 
### 2/8/2019 

-----------------

## DEPR: 2/14/19 This has now been added and edited on Medium. No more changes will be captured in this version. https://medium.com/@james.meadow/reproducible-data-science-environment-with-virtualenv-29a663018a72


One of the simplest (and most important!) habits we can develop as collaborative, successful data scientists is creating and working in isolated and reproducible environments. 

There are several pieces of this puzzle, including containerization, version control, and literate programming. Here I'll focus on `virtualenv`, which creates a simple, lightweight, reproducible computing environment. All data science projects should start here, or with a similar reproducible toolset

### Why `virtualenv` 

The simplest way to create an isolated, reproducible data science environment is `virtualenv`. If this isn't the first thing you do when spinning up a terminal or VM, then read on! 

`virtualenv` is a very clever tool to isolate environmental variables and packages. It is the cure to error messages that complain about the wrong python package version. 

There are many, many ways to use this powerful tool, but the principle is simple: when you activate a `virtualenv`, you are in a consistent, reliable, and reproducible software environment. You have control over the version of all python packages, and even python itself (i.e., eliminate python 2 vs 3 confusion when you share your code). 

Some advantages of `virtualenv`: 

* Always start in a clean, managed coding environment 
* When you share your code, a few commands will perfectly duplicate your clean environment in a new place 
* When you move your code from local to the cloud, your environment can be duplicated on the fly



### Hello `virtualenv`


This is remarkably simple. Once you get into the habit, it takes 2 minutes at the beginning of a project. 

To avoid Mac vs Windows installation differences, we'll start assuming you are in a brand new linux VM. But for more extensive installation and useage, check [here](https://virtualenv.pypa.io/en/latest/).  

First, you'll need to update the linux installation, and then install pip: 

``` 
sudo apt-get update 
sudo apt-get install python-pip
```

Next, you can use pip to install `virtualenv`: 

```
pip install virtualenv 
``` 

Boom. You can now isolate a virtual environment very quickly. 


At the basic level, there is one command: `$ virtualenv ENV`

* This creates a new environment, and you can find the new environment using the name you use in place of "ENV". You can call this anything you want (hopefully descriptive!). And then there are a handful of options. 

To create an environment 

```
virtualenv --python python3 p3env 
```

A few clever things happened in the background to create guardrails around the new isolated environment, but your are not in it yet. 
Importantly, a new directory (`~/env/`) has now been created in your home directory. You can use any name for the new environment (in this case `p3env`). 


Now we slip into the isolated environment: 

```
source env/bin/activate 
```

So now you're in the newly created, isolated virtual environment. Everything you install here will be put into a clean, reproducible workflow, and will not interfere with other installations on your VM or laptop. 

When there are a few python packages that will be required, you can invoke `pip` to reproduce the correct installations. 

Now create a `requirements.txt` file that will be carried along in your code repo. The contents of the file are arranged like so: 

```
## data science libraries 
pandas
sklearn
numpy 
keras

## specific package version 
tensorflow==1.11.0 

## cloud-specific libraries 
google-cloud 
google-cloud-storage
google-cloud-pubsub
google-cloud-bigquery
pandas-gbq
```

In the `requirements.txt` example above, we're loading a few standard data science libraries (pandas, sklearn, numpy, keras), and also installing a specific version of tensorflow (notoriously version-dependent!). Finally, we're working in a VM on Google Cloud Platform, so we'll install a few packages to allow python to interact effectively with GCP services, some of which need to be installed in the correct order. 

`pip` is able to work with the `requirements.txt` file: 

```
pip install -r requirements.txt
```


And we're off! If the flow above was executed correctly, and the requirements were comprehensive, we now have a new environment that is perfectly reproducible. 

From here, your normal data science, notebook, version-controlled, etc. workflow can be carried out without the normal hangups. 

Finally, when you are finished with this environment, simply `deactivate` it. No, really. You literally type `deactivate` and you are back in your previous environment. 










