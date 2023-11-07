# Ezmeral - AI Model deployment

This project is designed to facilitate the deployment of an AI model on the Ezmeral platform offered by the HPE team.


## TL;DR

Clone the  [repository](https://github.com/GATEKEEPER-OU/ezmeral-deployment) into AI model folder `~/project_repo/code`.

```
$ cd ~/project_repo/code
$ git clone https://github.com/GATEKEEPER-OU/ezmeral-deployment.git <PROJECT_NAME>
```

`<PROJECT_NAME>` can take on the following values:

- whoadherence
- adaadherence
- mobilityconcern
- mobilityprogress
- parecommender (NOT YET)

If you encounter downloading problems, you might need to set the proxy running the line below. Then try to clone again.

```
$ export http_proxy=http://web-proxy.seclab.local:8088; \
  export https_proxy=http://web-proxy.seclab.local:8088
```

Generate project files of desired AI model running

```
$ ./configure.sh <PROJECT_TAG>  # Choose between who|ada|mc|mp
```

## Install

See the __INSTALL.md__ file generated by the `configure.sh` script for the full step-by-step guide.