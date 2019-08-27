from mlp.dataprocessing import data, X, y
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
from sklearn.metrics import mean_squared_error
from sklearn.ensemble import RandomForestRegressor
from sklearn.ensemble import GradientBoostingRegressor

import matplotlib.pyplot as plt
import numpy as np

def perform_linear_regression_via_train_test_split(test_size):
	print("/// performing linear regression via train/test split ///")
	
	reg = LinearRegression()

	x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=test_size, random_state=2)

	reg.fit(x_train, y_train)
	y_pred = reg.predict(x_test)
	rmse_test = mean_squared_error(y_test, y_pred)**(1/2)

	print("Linear regression score: " + str(reg.score(x_test, y_test)))
	print("Linear regression RMSE: {:.2f}".format(rmse_test))

def perform_linear_regression_via_cross_validation(cv):
	print("/// performing linear regression via cross validation ///")
	
	reg = LinearRegression()

	cv_scores = cross_val_score(reg, X, y, cv=cv)

	print("CV scores: " + str(cv_scores))
	print("Average " + str(cv) + "-Fold CV Score: {}".format(np.mean(cv_scores)))

def perform_gradient_boosting_via_train_test_split(test_size, n_estimators, max_depth, min_samples_split, learning_rate, loss):
	print("/// performing gradient boosting via train/test split ///")

	clf = GradientBoostingRegressor(n_estimators=n_estimators, max_depth=max_depth, min_samples_split=min_samples_split, learning_rate=learning_rate, loss=loss)

	x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=test_size, random_state=2)

	clf.fit(x_train, y_train)
	y_pred = clf.predict(x_test)
	rmse_test = mean_squared_error(y_test, y_pred)**(1/2)

	print("Gradient boost score: " + str(clf.score(x_test, y_test)))
	print("Gradient boost RMSE: {:.2f}".format(rmse_test))

def perform_gradient_boosting_via_cross_validation(cv, n_estimators, max_depth, min_samples_split, learning_rate, loss):
	print("/// performing gradient boosting via cross validation ///")

	clf = GradientBoostingRegressor(n_estimators=n_estimators, max_depth=max_depth, min_samples_split=min_samples_split, learning_rate=learning_rate, loss=loss)

	cv_scores = cross_val_score(clf, X, y, cv=cv)

	print("CV scores: " + str(cv_scores))
	print("Average " + str(cv) + "-Fold CV Score: {}".format(np.mean(cv_scores)))

def perform_random_forest_regression_via_train_test_split(test_size, n_estimators, max_depth, min_samples_split):
	print("/// performing random forest regression via train/test split ///")

	rf = RandomForestRegressor(n_estimators=n_estimators, max_depth=max_depth, min_samples_split=min_samples_split)

	x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=test_size, random_state=2)

	rf.fit(x_train, y_train)
	y_pred = rf.predict(x_test)
	rmse_test = mean_squared_error(y_test, y_pred)**(1/2)

	print("Random forest score: " + str(rf.score(x_test, y_test)))
	print("Random forest RMSE: {:.2f}".format(rmse_test))

def perform_random_forest_regression_via_cross_validation(cv, n_estimators, max_depth, min_samples_split):
	print("/// performing random forest regression via cross validation ///")

	rf = RandomForestRegressor(n_estimators=n_estimators, max_depth=max_depth, min_samples_split=min_samples_split)

	cv_scores = cross_val_score(rf, X, y, cv=cv)

	print("CV scores: " + str(cv_scores))
	print("Average " + str(cv) + "-Fold CV Score: {}".format(np.mean(cv_scores)))