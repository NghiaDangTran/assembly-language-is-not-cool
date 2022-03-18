#include <sstream> //necessary for using stringstream
#include <fstream> //necessary to use ifstream (to open a file)
#include <string>
#include <iostream>
#include "queue.cpp"
#include "stack.cpp"
#include "waiting_list.cpp"
#include "menu.cpp"
#include "Node.cpp"
#pragma once

// #include <algorithm>

// # include "stac.cpp"
using namespace std;

int main(int argc, char *argv[])
{
	if (argc != 3)
	{
		cout << "USAGE: FileReadingExample.exe filename simulationType" << endl;
		cout << "where simulationType is either 1, 2 or 3." << endl;
		return 0;
	}

	string filename = argv[1];
	string version = argv[2];

	cout << "The filename is: " << filename << endl;
	cout << "The version selected is: " << version << endl;

	//
	// Opening the file, reading one line (just the first one of the file here) and parsing it
	//

	ifstream inputFile;
	inputFile.open(filename); // opening the file for reading
	string line;
	// if the file is empty, lineNumber will be 0, otherwise it will be 1
	int totalCharRead = 0;
	int total = 0;
	int chefTime = 0;
	int doctProessTime = 0;
	int totalorder = 0;
	double totalrev = 0;
	waiting_list *list;
	if (version == 1)
	{
		queue q;
		list = &q;
	}
	else if (version == 2)
	{
		stack s;
		list = &s;
	}
	else if (version == 3)
	{
		// stac s;
	}
	else
	{
		cout << "Invalid version number" << endl;
		return 0;
	}

	while (getline(inputFile, line)) // gets the next line from the file and saves it in 'line', if there is one
	{
		// getline(inputFile, line);
		totalCharRead += line.length() + 1;
		stringstream sst(line); // stringstream allows us to parse the line token by token (kind of like a Scanner in Java)
		string token;
		int counter = 0;
		int time = 0;
		int expiry = 0;
		string meal = "";
		int numIngredients = 0;

		while (sst >> token) // grabing one token at a time, until there is no token left
		{
			if (counter == 0) // reading time
				time = stoi(token);
			else if (counter == 1) // reading expiry
				expiry = stoi(token);
			else if (counter == 2) // reading meal type
				meal = token;
			else // counting ingredients from here (if counter > 2)
			{
				numIngredients++;
			}
			counter++;
		}

		if (chefTime < time)
		{
			chefTime = time;
		}

		// To show that we grabbed all the relevant information:
		cout << "time=" << time << " expiry=" << expiry << " meal=" << meal << " numIngredients=" << numIngredients << endl;

		// readahead one character
		// if the next character is not a newline, then there are more ingredients to read
		// if the next character is a newline, then we are done reading ingredients
		// getline(inputFile, line);

		while (chefTime >= time)
		{
			menu toadd = String_meal(meal);

			int porcesstime = toadd.getPrepTime() + numIngredients;
			if (porcesstime + chefTime > expiry)
			{
				break;
			}
			else
			{
				count << " the food is getinng ready please wait" << endl;
				list->add(toadd, numIngredients);
				doctProessTime = porcesstime + chefTime;
			}
			// print customer added to queue
			if (getline(inputFile, line))
			{

				// 		stringstream sst(line); // stringstream allows us to parse the line token by token (kind of like a Scanner in Java)
				// string token;
				// int counter = 0;
				// int time = 0;
				// int expiry = 0;
				// string meal = "";
				// int numIngredients = 0;

				// while (sst >> token) // grabing one token at a time, until there is no token left
				// {
				// 	if (counter == 0) // reading time
				// 		time = stoi(token);
				// 	else if (counter == 1) // reading expiry
				// 		expiry = stoi(token);
				// 	else if (counter == 2) // reading meal typeư
				// 		meal = token;
				// 	else // counting ingredients from here (if counter > 2)
				// 	{
				// 		numIngredients++;
				// 	}
				// 	counter++;
				// }
				// getline(inputFile, line);
				totalCharRead += line.length() + 1;
				stringstream sst(line);
				string token;
				sst >> token;
				if (stoi(token) < doctProessTime)
				{
					time = stoi(token);

					continue;
					// ??
				}

				else
				{
					// inputFile.seekg(-line.length() - 1, inputFile.cur);
					inputFile.seekg(totalCharRead - line.length() - 1);
					getline(inputFile, line);
					break;
				}
			}
		}
		if (!waiting_list.isEmpty())
		{
			Node *remove = list->remove();
			count << "the food is ready" << endl;
			count << "total rev" << endl;
			totalrev += remove->getPrice();
			totalorder++;
			chefTime += remove->getPrepTime() + numIngredients;
			// print gia tri
		}

		// getline(inputFile, line);
		// cout << "" << line << endl;
		// getline(inputFile, line);
		// cout << "" << line << endl;

		// (inputFile, line);getline
		// 	cout << "" << line << endl;
	}
}

menu String_meal(String meal)
{

	if (meal == "Salad")
	{
		return salad();
	}
	else if (meal == "Pizza")
	{
		return pizza();
	}
	else if (meal == "Burger")
	{
		return burger();
	}
	else if (meal == "Stew")
	{
		return stew();
	}
	else
	{
		cout << "Invalid meal type" << endl;
		return null;
	}
	{
		/* code */
	}
}