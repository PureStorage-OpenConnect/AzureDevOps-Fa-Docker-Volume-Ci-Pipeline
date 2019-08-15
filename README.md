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

7. The results for each unit test are aggregated and published, if one or more test fails, the entire pipeline execution will fail.
