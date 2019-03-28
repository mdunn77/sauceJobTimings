# Sauce Labs Job Timings

useful command line tool to compute job timings for a Sauce Labs test

### Prerequisites

* curl must be in your PATH
* [jq](https://stedolan.github.io/jq/) must be installed and in your PATH - easiest way on a Mac is to use [Homebrew](https://brew.sh/) and install using ```brew install jq```
* your Sauce username and access key must be set in the environment variables **SAUCE_USERNAME** and **SAUCE_ACCESS_KEY**

### Using the tool

To get job timings for a single test:

```./jobTimings -t <test user> -j <job ID>```
 
* 'test user' is the user who ran the Sauce test
* 'job ID' is the job/test ID

To get job timings for the 100 most recent tests:

```./jobTimings -t <test user> -n <number of tests>```
 
* 'test user' is the user who ran the Sauce test
* 'number of tests' is the number of tests to get timings for

To get job timings for the 100 most recent tests, *with brief output*:

```./jobTimings -t <test user> -n <number of tests> -b```
 
* 'test user' is the user who ran the Sauce test
* 'number of tests' is the number of tests to get timings for

To specify a datacentre:

```./jobTimings -t <test user> -n <number of tests> -d <DC>```

* 'DC' is either US (default) or EU


### Example

Single job:

```
$ ./jobTimings -t mattdsauce -j 72422e2569784a02b0f55b103dfa2377
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

5 most recent jobs:

```
./jobTimings -t mattdsauce -n 5
SAUCE USERNAME: mattdsauce
TEST USER: mattdsauce
NUMBER OF JOBS: 5
Getting last 5 job IDs
f06dc2836297486691c2a811b7edd18c commands: 3, total time: 11.1385378837585445, total durations: 9.797035694122314, avg duration: 3.265678564707438, total between: 1.3415021896362305, avg between: 0.44716739654541016
72422e2569784a02b0f55b103dfa2377 commands: 453, total time: 107.60206890106201, total durations: 26.70633602142334, avg duration: 0.0589543841532524, total between: 80.89573287963867, avg between: 0.1785777767762443
70cd764d950441869c416cbcef73b032 commands: 452, total time: 129.180177927017214, total durations: 27.632445335388184, avg duration: 0.06113372861811545, total between: 101.54773259162903, avg between: 0.22466312520271908
059a6bb5a3f54f3c845f60526fdbf0e7 commands: 3, total time: 78.49672794342041, total durations: 13.05505084991455, avg duration: 4.351683616638184, total between: 65.44167709350586, avg between: 21.813892364501953
e4286d5e31e846f3a39a2abb26b920e9 commands: 3, total time: 37.159999847412108, total durations: 19.736999988555908, avg duration: 6.578999996185303, total between: 17.4229998588562, avg between: 5.807666619618733
```

5 most recent jobs with brief output (shows only job ID and avg duration):

```
./jobTimings -t mattdsauce -n 5 -b
f06dc2836297486691c2a811b7edd18c, 3.265678564707438
72422e2569784a02b0f55b103dfa2377, 0.0589543841532524
70cd764d950441869c416cbcef73b032, 0.06113372861811545
059a6bb5a3f54f3c845f60526fdbf0e7, 4.351683616638184
e4286d5e31e846f3a39a2abb26b920e9, 6.578999996185303
```
