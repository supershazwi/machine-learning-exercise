# Technical Assessment for an AI Programme
---
This is an attempt at the technical assessment given. There are two python files `dataprocessing.py` and `exercise.py` within the `mlp` folder. 

When running `./run.sh` from the base directory, you will be prompted to select one of the 6 algorithm options to test on the dataset. 

After selecting an option, depending on the algorithm, you will be prompted to key in parameters. 

Once you've keyed in all the parameters, the script will run `exercise.py` with the necessary parameters. `exercise.py` will first run `dataprocessing.py`, whose tasks is to visit the url given in the assessment and downloading the csv into a dataframe. 

From what we gathered from exploratory data analysis, in `dataprocessing.py`, we also drop columns such as transaction date, house age and shifted the house price into a separate dataframe.