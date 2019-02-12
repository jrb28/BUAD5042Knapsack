# -*- coding: utf-8 -*-

import time
import json

def checkCapacity(contents,knapsack_cap):
    """ contents is expected as a dictionaryof the form {item_id:(volume,value), ...} """
    """ This function returns True if the knapsack is within capacity; False if the knapsack is overloaded """
    load = 0
    if isinstance(contents,dict):
        for this_key in contents.keys():
            load = load + contents[this_key][0]
        if load <= knapsack_cap:
            return True
        else:
            return False
    else:
        print("function checkCapacity() requires a dictionary")

def knapsack_value(items):
    value = 0.0
    if isinstance(items,dict):
        for this_key in items.keys():
            value = value + items[this_key][1]
        return(value)
    else:
        print("function knapsack_value() requires a dictionary")

def getData():
    f = open('knapsack.json','r')
    x = json.load(f)
    f.close()
    for i in range(len(x)):
        myData = x[i]['data']
        x[i]['data'] = {}
        for j in range(len(myData)):
            x[i]['data'][j] = tuple(myData[j]) 
    return x

def loadKnapsack(items,knapsack_cap):
    """ You write this function which is your heuristic knapsack algorithm
    
        You may indicate one or more items to put into the backpack within a list data structure
        by returning a list of values corresponding to the dictionary keys for the inserted items
    
        If you are finished loading the knapsack, then return any string value  """
        
    """ Compute existing load in knapsack """
    myUsername = 'jrbrad' # always return this variable as the first item
    nickname = '' # This idenfier will appear on the leaderboard, if you desire to be identified.  This may be left as an empty string.
    items_to_pack = []    # use this list for the indices of the items you load into the knapsack
    
    load = 0.0            # use this variable to keep track of how much volume is already loaded into the backpack
    value = 0.0           # value in knapsack
        
    item_keys = [k for k in items.keys()]
    pack_item = item_keys[0]
    items_to_pack.append(pack_item)
    load += items[pack_item][0]
    value += items[pack_item][1]
    
    return myUsername, nickname, items_to_pack       # use this return statement when you have items to load in the knapsack
        

""" Main code """
""" Get data and define problem ids """
probData = getData()
problems = range(len(probData))
silent_mode = False    # use this variable to turn on/off appropriate messaging depending on student or instructor use
""" Error Messages """
error_bad_list_key = """ 
A list was received from load_knapsack() for the item numbers to be loaded into the knapsack.  However, that list contained an element that was not a key in the dictionary of the items that were not yet loaded.   This could be either because the element was non-numeric, it was a key that was already loaded into the knapsack, or it was a numeric value that didn't match with any of the dictionary keys. Please check the list that your load_knapsack function is returning. It will be assumed that the knapsack is fully loaded with any items that may have already been loaded and a score computed accordingly. 
"""
error_response_not_list = """
load_knapsack() returned a response for items to be packed that was not a list.  Scoring will be terminated   """

for problem_id in problems:
    in_knapsack = {}
    knapsack_cap = probData[problem_id]['cap']
    items = probData[problem_id]['data']
    errors = False
    response = None
    
    startTime = time.time()
    team_num, response = loadKnapsack(items,knapsack_cap)
    execTime = time.time() - startTime
    if isinstance(response,list):
        for this_key in response:
            if this_key in items.keys():
                in_knapsack[this_key] = items[this_key]
                del items[this_key]
            else:
                errors = True
                if silent_mode:
                    status = "bad_list_key"
                else:
                    print("P"+str(problem_id)+"bad_key_")
                #finished = True
    else:
        if silent_mode:
            status = "P"+str(problem_id)+"_not_list_"
        else:
            print(error_response_not_list)
                
    if errors == False:
        if silent_mode:
            status = "P"+str(problem_id)+"knap_load_"
        else:
            print("Knapsack Loaded for Problem ", str(problem_id)," ....", '    Execution time: ', execTime, ' seconds')
        knapsack_ok = checkCapacity(in_knapsack,knapsack_cap)
        knapsack_result = knapsack_value(in_knapsack)
        if silent_mode:
            print(status+"; knapsack within capacity: "+knapsack_ok)
        else:
            print("knapcap: ", knapsack_ok)
            print("knapsack value : ", knapsack_value(in_knapsack))