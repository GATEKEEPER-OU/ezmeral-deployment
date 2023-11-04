# AI Model - Ezmeral deployment

## Prepare

Clone the `ezmeral-deployment` project renaming the project folder with one of the following name:
- whoadherence
- adaadherence
- mobilityconcern
- mobilityprogress
- parecommender (NOT YET)

```
git clone https://github.com/GATEKEEPER-OU/ezmeral-deployment.git <PROJECT_NAME>
```

Starting from the project folder, run
```
 sh configure.sh <PROJECT_TAG>  # Choose between who|ada|mc|mp
```
respectively to the model you want to initialize.
At the end of the configuration stage, new files will appear:
- download-deps.sh
- <PROJECT_NAME>_apihandler.py
- deployment.ipynb
- run.ipynb

## Download dependency and test the Jar

Download the dependency Jar running the command below:
```
sh download-deps.sh
```

It might be necessary to install the Java Virtual Machine to test locally the apihandler. In that case exec the commands below:
```
$ mkdir -p ~/.local/share/jvm && curl -L https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz | tar -xz -C ~/.local/share/jvm

... TODO ask to Chiara
```

Open the `test` notebook from the online JupiterLab platform offered by HPE Ezmeral and execute the only box.

## Register the model

Open the `deployment` notebook from JupiterLab, execute all boxes and wait for the app setup. It will take a few minutes.
Once completed, we must remember to install java virtual machine into the `restserver`; but before that, we need to collect some more information on the system. Procedure which will be addressed in the next paragraph.



## Post-installation

https://hpe-ere-controller.seclab.local/bdswebui/k8stenant/dashboard
Once completed the previous step, open the `run` notebook


<!--
git clone https://github.com/GATEKEEPER-OU/ezmeral-deployment.git


Setup the environment according to the relative profile
```
sh configure.sh <PROFILE>
```


 -->





## Delete deployment


`kubectl delete kdcluster <MODEL_ID>`
`kubectl delete kdcluster who-adherence-model`
