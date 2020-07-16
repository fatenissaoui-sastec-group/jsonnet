# Jsonnet Project Template

This project template serves as a starting point to use GitLab CI [Dynamic Child Pipelines](https://docs.gitlab.com/ee/ci/parent_child_pipelines.html#dynamic-child-pipelines) with [Jsonnet](https://jsonnet.org/) to generate complex `gitlab-ci.yml` files at runtime.

Jsonnet provides functions, variables, loops, and conditionals that can allow to create fully paramaterized YAML configuration.

# Components

This project contains two files:

## .gitlab-ci.jsonnet

This simple example contains a [Jsonnet script](gitlab-ci.jsonnet) that generates two unique jobs for a scenario where you might want to dynamically generate your testing jobs:

- `rspec`
- `rspec 2`

`local param_job` serves as the template for all the jobs. It also takes advantage of the `parallel` keyword to create two copies of each job.

From here you can use Jsonnet to generate CI YAML in an easy way. To learn more about Jsonnet, check out its [tutorial](https://jsonnet.org/learning/tutorial.html) or [getting started guide](https://jsonnet.org/learning/getting_started.html). The complete [GitLab CI YAML Configuration Reference](https://docs.gitlab.com/ee/ci/yaml/) is also available to help.

## .gitlab-ci.yml

The [`.gitlab-ci.yml`](.gitlab-ci.yml) file contains two important jobs:

### jsonnet

This job fetches the Jsonnet package from `apk` and runs it to create the `generated-config.yml`, which is the emitted YAML. The `generated-config.yml` is stored as an artifact to make it available for triggering in the next step.

### trigger-tests

`trigger-tests` is a [trigger job](https://docs.gitlab.com/ee/ci/yaml/#trigger) responsible for starting the dynamic child pipeline. It takes the YAML artifact from the previous `jsonnet` job and starts the dynamic pipeline.
