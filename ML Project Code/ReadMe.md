Project Title: Using Machine Learning to Control a Physical System
By: Lauren Spaulding

Description: The goal of this project is to use machine learning to simulate
control of the electro-mechanical inverted pendulum on a segway system by
limiting the voltage input in such a way that the system remains balanced.

Datasets used:
X1 - The original inverted pendulum on a segway system used for testing and
training the model
X2 - Inverted pendulum on a segway system with slight parameter variations
X3 - Another inverted pendulum on a segway system with slight parameter
variations
X4 - Inverted pendulum on a cart system used for testing the model

Data was generated using the Matlab and Simulink files provided.  Each set
contains (in this order) the following columns: position, horizontal velocity,
angle, angular velocity, controlled voltage input, time index

Instructions:
Put the included datasets in your google drive directory.  Change the code
indicating the location of each dataset to reflect your directory.
For deep neural network results, run the Prelim_Results.ipynb file.
For LSTM model results, run the LSTM.ipynb file.

Results:
Testing on X1, X2, and X3 data was relatively successful due to R^2 scores.
Testing on X4 failed, probably because the system states.

Key finding: Using an LSTM model worked better than using a deep neural
network.