# Overview

This example pipeline illustrates the use of docker volumes to scale out the testing element of an Azure DevOps pipeline: 

![image](https://user-images.githubusercontent.com/15145995/63097296-f2f21980-bf67-11e9-9693-d5521c31a6fb.png)

The pipeline comprises of the following stages:

1. A SQL Server Data Tools (SSDT) project is checked out of source code control (GitHub),

2. The project is built resulting in a DacPac,

3. A seed 'Docker' volume is cloned four times,

4. Four sidecar containers based on the official Microsoft SQL Server 2017 image are created using a copy of the seed volume created i the previous step,

5. The DacPac will be deployed to each of the four containers,

6. A tSQLt unit test is performed against each container,

7. The results for all unit tests are aggregated and published.

# Pipeline Build Infrastructure

![image](https://user-images.githubusercontent.com/15145995/63102506-343bf680-bf73-11e9-8f7f-a50bee2cf746.png)

The pipeline infrastructure consists of:

- An Azure DevOps pipeline in the Azure public cloud

- An on-premises Windows 2016 server, this hosts four build agents that are used for the BuildDacPac, DeployAndTestDacPac and the PublishTestResults jobs.

- An on-premises Ubuntu server, this is used for the CleanEnvironment and BuildTestEnvironment jobs in the pipeline. 

# Pre-Requisite Software Build Components

This example requires that the following software components are installed:



- On-premises Windows server~

    [Azure DevOps build agent for windows](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops)

    [Data tier applications toolkit framework](https://www.microsoft.com/en-us/download/details.aspx?id=55114)
    
    [msbuild for SQL Server Data Tools targets](https://www.nuget.org/packages/Microsoft.Data.Tools.Msbuild/)

    [sqlcmd](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-2017)

    [Git for Windows](https://git-scm.com/download/win)

- On-premises Ubuntu server

   [Azure DevOps build agent for Linux](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops)

   [Docker engine for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
   
   [Pure Storage Python SDK for FlashArray](https://pure-storage-python-rest-client.readthedocs.io/en/latest/installation.html)
   
   [Pure Storage Service Orchestrator (PSO)](https://hub.docker.com/r/purestorage/k8s/)
   
   [Python 3 runtime for Ubuntu](https://packages.ubuntu.com/xenial/python3-apt)
   
   [urllib3 package for python](https://github.com/urllib3/urllib3/issues/1392)
   
# The Docker Volume Clone Process   

At the time of writing Docker does not furnish a native means by which Docker volumes can be cloned, therefore the following process is followed:

- each sidecar container is started up with an empty (blank) docker volume,
- once started each sidecar container is stopped
- the Python code in templates/clone-docker-volume.yml is used to copy the 'Seed' Docker volume over the top of each sidecar container's blank volume
- each side car container is re-started

The python code in the Azure DevOps pipeline template leverages FlashArray via the Python SDK which in turn communicates to the FlashArray via its REST API.

# Pipeline Variables

This example pipeline uses the following variables which must be set correctly prior to the pipeline being executed for the first time:

![image](https://user-images.githubusercontent.com/15145995/63107469-e6c48700-bf7c-11e9-847f-518b650ac7dd.png)

