# -*- coding: utf-8 -*-
"""
Spyder Editor
"""

import MySQLdb as mySQL
import time

""" global MySQL settings """
mysql_user_name = 'my_username'
mysql_password = 'my_password'
mysql_ip = '127.0.0.1'
mysql_db = 'knapsack'

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
        print "function checkCapacity() requires a dictionary"

def knapsack_value(items):
    value = 0.0
    if isinstance(items,dict):
        for this_key in items.keys():
            value = value + items[this_key][1]
        return(value)
    else:
        print "function knapsack_value() requires a dictionary"

def load_knapsack(things,knapsack_cap):
    """ You write your heuristic knapsack algorithm in this function using the argument values that are passed
             items: is a dictionary of the items no yet loaded into the knapsack
             knapsack_cap: the capacity of the knapsack (volume)
    
        Your algorithm must return two values as indicated in the return statement:
             my_team_number_or_name: if this is a team assignment then set this variable equal to an integer representing your team number;
                                     if this is an indivdual assignment then set this variable to a string with you name
            items_to_pack: this is a list containing keys (integers) of the items you want to include in the knapsack
                           The integers refer to keys in the items dictionary. 
   """
        
    my_team_number_or_name = "jrbrad"    # always return this variable as the first item
    items_to_pack = []    # use this list for the indices of the items you load into the knapsack
    load = 0.0            # use this variable to keep track of how much volume is already loaded into the backpack
    value = 0.0           # value in knapsack
        
    item_keys = [k for k in things.keys()]
    pack_item = item_keys[0]
    items_to_pack.append(pack_item)
    load += things[pack_item][0]
    value += things[pack_item][1]
    
    return my_team_number_or_name, items_to_pack       # use this return statement when you have items to load in the knapsack

def getDBDataList(commandString):
    cnx = db_connect()
    cursor = cnx.cursor()
    cursor.execute(commandString)
    items = []
    for item in list(cursor):
        items.append(item[0])
    cursor.close()
    cnx.close()
    return items
   
""" db_get_data connects with the database and returns a dictionary with the knapsack items """
def db_get_data(problem_id):
    cnx = db_connect()
                        
    cursor = cnx.cursor()
    cursor.execute("CALL spGetKnapsackCap(%s);" % problem_id)
    knap_cap = cursor.fetchall()[0][0]
    cursor.close()
    cursor = cnx.cursor()
    cursor.execute("CALL spGetKnapsackData(%s);" % problem_id)
    items = {}
    blank = cursor.fetchall()
    for row in blank:
        items[row[0]] = (row[1],row[2])
    cursor.close()
    cnx.close()
    return knap_cap, items
    
def db_connect():
    cnx = mySQL.connect(user=mysql_user_name, passwd=mysql_password,
                        host=mysql_ip, db=mysql_db)
    return cnx
    
""" Error Messages """
error_bad_list_key = """ 
A list was received from load_knapsack() for the item numbers to be loaded into the knapsack.  However, that list contained an element that was not a key in the dictionary of the items that were not yet loaded.   This could be either because the element was non-numeric, it was a key that was already loaded into the knapsack, or it was a numeric value that didn't match with any of the dictionary keys. Please check the list that your load_knapsack function is returning. It will be assumed that the knapsack is fully loaded with any items that may have already been loaded and a score computed accordingly. 
"""
error_response_not_list = """
load_knapsack() returned a response for items to be packed that was not a list.  Scoring will be terminated   """

""" Get solutions bassed on sbmission """
problems = getDBDataList('CALL spGetProblemIds();') 
silent_mode = False    # use this variable to turn on/off appropriate messaging depending on student or instructor use

for problem_id in problems:
    in_knapsack = {}
    knapsack_cap, items = db_get_data(problem_id)
    #finished = False
    errors = False
    response = None
    
    startTime = time.time()
    team_num, response = load_knapsack(items,knapsack_cap)
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
                    print "P"+str(problem_id)+"bad_key_"
                #finished = True
    else:
        if silent_mode:
            status = "P"+str(problem_id)+"_not_list_"
        else:
            print error_response_not_list
                
    if errors == False:
        if silent_mode:
            status = "P"+str(problem_id)+"knap_load_"
        else:
            print "Knapsack Loaded for Problem ", str(problem_id)," ....", '    Execution time: ', execTime, ' seconds' 
        knapsack_ok = checkCapacity(in_knapsack,knapsack_cap)
        knapsack_result = knapsack_value(in_knapsack)
        if silent_mode:
            print status+"; knapsack within capacity: "+knapsack_ok
        else:
            print "knapcap: ", knapsack_ok
            print "knapsack value : ", knapsack_value(in_knapsack)
