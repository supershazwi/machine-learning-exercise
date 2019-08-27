#!/bin/bash

echo " "
echo "Technical Assessment for AIAP Apprenticeship"
echo "--------------------------------------------"
echo " "

echo "There are 6 different algorithms that you can use on the dataset. Type 'exit' to exit."
echo "1 - Linear Regression via train/test split"
echo "2 - Linear Regression via cross validation"
echo "3 - Gradient Boosting via train/test split"
echo "4 - Gradient Boosting via cross validation"
echo "5 - Random Forest Regression via train/test split"
echo "6 - Random Forest Regression via cross validation"

read -p "Enter algorithm to use: " algoOption

if [ -z "$algoOption" ]
then	
	echo "You have not provided an input."
	./run.sh
else
	if [ $algoOption == 1 ]
	then
		echo "You have selected Linear Regression via train/test split."
		echo " "

		read -p "Enter test size to use (defaulted to 0.1) i.e. type '0.1' if you want 10% of dataset to be splitted as a test set: " testSize
		echo " "

		if [ -z "$testSize" ]
		then
			testSize=0.1
		fi

		python -c "import mlp.exercise; mlp.exercise.perform_linear_regression_via_train_test_split($testSize)"
		./run.sh
	elif [ $algoOption == 2 ]
	then
		echo "You have selected Linear Regression via cross validation."
		echo " "

		read -p "Enter number of folds to use (defaulted to 3): " cv
		echo " "

		if [ -z "$cv" ]
		then
			cv=3
		fi

		python -c "import mlp.exercise; mlp.exercise.perform_linear_regression_via_cross_validation($cv)"
		./run.sh
	elif [ $algoOption == 3 ]
	then
		echo "You have selected Gradient Boosting via train/test split."
		echo " "

		read -p "Enter test size to use (defaulted to 0.1) i.e. type '0.1' if you want 10% of dataset to be splitted as a test set: " testSize
		echo " "

		if [ -z "$testSize" ]
		then
			testSize=0.1
		fi

		read -p "Enter number of boosting stages to use (defaulted to 100): " nEstimators
		echo " "

		if [ -z "$nEstimators" ]
		then
			nEstimators=100
		fi

		read -p "Enter max depth to use (defaulted to 3): " maxDepth
		echo " "

		if [ -z "$maxDepth" ]
		then
			maxDepth=3
		fi

		read -p "Enter minimum samples split to use (defaulted to 2): " minSamplesSplit
		echo " "

		if [ -z "$minSamplesSplit" ]
		then
			minSamplesSplit=2
		fi

		read -p "Enter learning rate to use (defaulted to 0.1): " learningRate
		echo " "

		if [ -z "$learningRate" ]
		then
			learningRate=0.1
		fi

		read -p "Enter loss function to use. Choose from ('ls’, ‘lad’, ‘huber’, ‘quantile’). (defaulted to 'ls'): " loss
		echo " "

		if [ -z "$loss" ]
		then
			loss="'ls'"
		else
			loss="'$loss'"
		fi

		python -c "import mlp.exercise; mlp.exercise.perform_gradient_boosting_via_train_test_split($testSize, $nEstimators, $maxDepth, $minSamplesSplit, $learningRate, $loss)"
		./run.sh
	elif [ $algoOption == 4 ]
	then
		echo "You have selected Gradient Boosting via cross validation."
		echo " "

		read -p "Enter number of folds to use (defaulted to 3): " cv
		echo " "

		if [ -z "$cv" ]
		then
			cv=3
		fi

		read -p "Enter number of boosting stages to use (defaulted to 100): " nEstimators
		echo " "

		if [ -z "$nEstimators" ]
		then
			nEstimators=100
		fi

		read -p "Enter max depth to use (defaulted to 3): " maxDepth
		echo " "

		if [ -z "$maxDepth" ]
		then
			maxDepth=3
		fi

		read -p "Enter minimum samples split to use (defaulted to 2): " minSamplesSplit
		echo " "

		if [ -z "$minSamplesSplit" ]
		then
			minSamplesSplit=2
		fi

		read -p "Enter learning rate to use (defaulted to 0.1): " learningRate
		echo " "

		if [ -z "$learningRate" ]
		then
			learningRate=0.1
		fi

		read -p "Enter loss function to use. Choose from ('ls’, ‘lad’, ‘huber’, ‘quantile’). (defaulted to 'ls'): " loss
		echo " "

		if [ -z "$loss" ]
		then
			loss="'ls'"
		else
			loss="'$loss'"
		fi

		python -c "import mlp.exercise; mlp.exercise.perform_gradient_boosting_via_cross_validation($cv, $nEstimators, $maxDepth, $minSamplesSplit, $learningRate, $loss)"
		./run.sh
	elif [ $algoOption == 5 ]
	then
		echo "You have selected Random Forest Regression via train/test split."
		echo " "

		read -p "Enter test size to use (defaulted to 0.1) i.e. type '0.1' if you want 10% of dataset to be splitted as a test set: " testSize
		echo " "

		if [ -z "$testSize" ]
		then
			testSize=0.1
		fi

		read -p "Enter number of trees to use (defaulted to 10): " nEstimators
		echo " "

		if [ -z "$nEstimators" ]
		then
			nEstimators=10
		fi

		read -p "Enter max depth to use (defaulted to None): " maxDepth
		echo " "

		if [ -z "$maxDepth" ]
		then
			maxDepth=None
		fi

		read -p "Enter minimum samples split to use (defaulted to 2): " minSamplesSplit
		echo " "

		if [ -z "$minSamplesSplit" ]
		then
			minSamplesSplit=2
		fi

		python -c "import mlp.exercise; mlp.exercise.perform_random_forest_regression_via_train_test_split($testSize, $nEstimators, $maxDepth, $minSamplesSplit)"
		./run.sh
	elif [ $algoOption == 6 ]
	then
		echo "You have selected Random Forest Regression via cross validation."
		echo " "

		read -p "Enter number of folds to use (defaulted to 3): " cv
		echo " "

		if [ -z "$cv" ]
		then
			cv=3
		fi

		read -p "Enter number of trees to use (defaulted to 10): " nEstimators
		echo " "

		if [ -z "$nEstimators" ]
		then
			nEstimators=10
		fi

		read -p "Enter max depth to use (defaulted to None): " maxDepth
		echo " "

		if [ -z "$maxDepth" ]
		then
			maxDepth=None
		fi

		read -p "Enter minimum samples split to use (defaulted to 2): " minSamplesSplit
		echo " "

		if [ -z "$minSamplesSplit" ]
		then
			minSamplesSplit=2
		fi

		python -c "import mlp.exercise; mlp.exercise.perform_random_forest_regression_via_cross_validation($cv, $nEstimators, $maxDepth, $minSamplesSplit)"
		./run.sh
	elif [ $algoOption == 'exit' ]
	then
		exit 1
	else
		echo "You have not selected an appropriate input."
		./run.sh
	fi
fi