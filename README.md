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

Open the `test` notebook from the online JupiterLab platform offered by HPE Ezmeral and execute all boxes.

Note: it might be necessary to install the Java Virtual Machine to test locally the apihandler. In that case follow the instructions written into the notebook.

## Register the model

Open the `deployment` notebook from JupiterLab, execute all boxes and wait for the app setup. It will take a few minutes.
Once completed, we must remember to install java virtual machine into the `restserver`; but before that, we need to collect some more information on the system. Procedure which will be addressed in the next paragraph.

## Post-installation

Before execute the `run` notebook, we must collect some information.
We can find the pod names from the HPE Ezmeral [Dashbord](https://hpe-ere-controller.seclab.local/bdswebui/k8stenant/dashboard).
We looking for `restserver` and `loadbalancer` names. Take notes from "All Pods (aggregated)" combodox. They will be something like
- __MODEL_ID__-restserver-XXXXX-0
- __MODEL_ID__-loadbalancer-YYYYY-0

Once completed the previous step, we have to install Java Virtual Machine into the `restserver`. So, open an online terminal and follow the next procedure:
```
kubectl exec -it __MODEL_ID__-model-restserver-XXXXX-0 -n development -- bash
```
It will open a terminal into the pod `restserver`, then run to install the JVM
```
$ yum -y update
$ rpm --import https://yum.corretto.aws/corretto.key
$ curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
$ yum install -y java-17-amazon-corretto-devel
```

Once completed, open the `run` notebook:
- Run Box #1. This will __fail__, but we will collect the `--token` that we need in the next step into the response.
- Paste the `load_balancer_id` and the `token` collected previously and run the box. In the response we will find useful informations: public service `port` and `auth_token`.
- In the following step, paste previous data into the next box, also fill the `post_body` and we are ready to launch the remote request and test the response.

## Delete deployment
```
kubectl delete kdcluster <MODEL_ID>
```
