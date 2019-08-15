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

    [Azure DevOps build agents for windows](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops)

    [Data tier applications toolkit framework](https://www.microsoft.com/en-us/download/details.aspx?id=55114)
    
    [msbuild for SQL Server Data Tools targets](https://www.nuget.org/packages/Microsoft.Data.Tools.Msbuild/)

    [sqlcmd](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-2017)

    [Git for Windows](https://git-scm.com/download/win)

- On-premises Ubuntu server

   [Azure DevOps build agents for Linux](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops)

   [Docker engine for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
   
   [Pure Storage Service Orchestrator (PSO)](https://hub.docker.com/r/purestorage/k8s/)
   
   
