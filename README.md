# Sauce Labs Job Timings

useful command line tool to compute job timings for a Sauce Labs test

### Prerequisites

* [jq](https://stedolan.github.io/jq/) must be installed and in your PATH
* your Sauce username and access key must be set in the environment variables **SAUCE_USERNAME** and **SAUCE_ACCESS_KEY**

### Using the tool

 ./jobTimings.sh -t <test user> -j <job ID>

### Example

```
$ ./jobTimings.sh -t mattdsauce -j 72422e2569784a02b0f55b103dfa2377

SAUCE USERNAME: mattdsauce
TEST USER: mattdsauce
JOB ID: 72422e2569784a02b0f55b103dfa2377
Getting log.json
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  185k    0  185k    0     0  46017      0 --:--:--  0:00:04 --:--:-- 51185
Parsing commands from log.json
Number of commands: 453
Total time: 107.60206890106201
Total command duration: 26.70633602142334
Average command duration: 0.0589543841532524
Total time between commands: 80.89573287963867
Average time between commands: 0.1785777767762443
```
