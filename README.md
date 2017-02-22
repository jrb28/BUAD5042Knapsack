# BUAD5042Knapsack
Programs and Data for the Knapsack Assignment

This repository contains the files necessary for the Knapsack Algorithm Assignment for the BUAD 5042, Heuristic Algorithms, 
course.

The repository contents include these files:

    * knapsack.dmp
    
        - MySQL dump file to be imported into MySQL.  It contains knapsack problem data.
        
    * scoreKnapsackDev.py
    
        - Python program that contains a "stub" area to write a load_knapsack() function which chooses which items 
          to be included in a knapsack.
          
        - This program also applies the algorithm specified in load_knapsack() to all the test problems in the
          knapsack database through existing functions taht access the related MySQL database.
          
        - Set silent_mode = False to get Spyder Console messages
        
        - Leave the problems list unchanged as it is populated from the knapsack database.
        
The database contains original knapsack problems as well as problems from this web site:

    http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html (accessed 2/21/2017)

Details:

  * The assignment is to write an algorithm in the knapsack_load() function that picks items from the items dictionary
    that are to be placed in the knapsack
    
  * Besides the items dictionary, the knapsack_load() function receives the knapsack capacity as its 2nd argument.
  
  * The knapsack_load() function returns, as its first parameter, a team number number (int or long) or a student id
    (string) if the assignment is an individual assignment
    
  * knapsack_load() must return a second value which is a list containing the keys (ints) of the items from the items 
    dictionary to be placed in the knapsack
    
  * A function will be scored only if the 2nd argument is a list where all the elements are valid items keys and
    none are repeated
