##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0307B-HierarchicalPanelManagement
# - Description: How to interact with Hierarchical left panel
#                - How to interact with the main Hierarchical left panel - main method
#                - How to interact with the main Hierarchical left panel by selecting the required level
#                - How to expand / collapse the hierarchical left list
#                - How to move to the previous / next page of the hierarchical left list
#                - How to maximize / minimize the hierarchical left list
#                - How to interact with the left table hierarchical panel
# - Created date: 19/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0307B-HierarchicalPanelManagement

    Scenario: 0307B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0307B1 - Left Panel management - How to interact with the main Hierarchical left panel - main method

        #Open function by code
        Given the user opens the "GESTPE" function

        #Check the function is opened
        Then the "Accounting entry types" screen is displayed

        #Left panel: select the main Hierarchical left list
        Given the user selects the main hierarchical panel of the screen

        #Left panel: expand the Hierarchical left list
        And the user selects the data table of left panel
        When the user clicks the "Expand all" button in the left top bar of the selected data table

        #Left panel: select the item in the hierarchical left list
        And the user selects the item "Accounts" of the hierarchical panel
        And the user expands the selected hierarchical panel item
        And the user selects the item "Not regrouped" of the hierarchical panel next level
        And the user expands the selected hierarchical panel item
        And the user selects the item "DEPREC FA - Depreciation" of the hierarchical panel next level
        And the user clicks on the selected hierarchical panel item

        #Verification the supplier category has been selected
        Given the user selects the text field with name: "Entry type"
        Then the value of the selected text field is "DEPREC"

        #Left panel: collapse the Hierarchical left list
        Given the user selects the main hierarchical panel of the screen
        And the user selects the data table of left panel
        When the user clicks the "Collapse all" button in the left top bar of the selected data table

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0307B2 - Left Panel management - How to interact with the main Hierarchical left panel by selecting the required level

        #Open function by code
        Given the user opens the "GESTPE" function

        #Check the function is opened
        Then the "Accounting entry types" screen is displayed

        #Left panel: select the main Hierarchical left list
        Given the user selects the main hierarchical panel of the screen

        #Left panel: expand the Hierarchical left list
        And the user selects the data table of left panel
        When the user clicks the "Expand all" button in the left top bar of the selected data table

        #Left list: select the required item of the hierarchical left list
        And the user selects the item "FASCNL FA - Cancellation" of the level 8 on the hierarchical panel
        And the user clicks on the selected hierarchical panel item

        #Verification the supplier category has been selected
        Given the user selects the text field with name: "Entry type"
        Then the value of the selected text field is "FASCNL"

        #Left panel: select the required data using the main Hierarchical left list by level
        Given the user selects the main hierarchical panel of the screen
        And the user selects the item "FASIML FA - Impairment" of the level 10 on the hierarchical panel
        And the user clicks on the selected hierarchical panel item

        #Verification the supplier category has been selected
        Given the user selects the text field with name: "Entry type"
        Then the value of the selected text field is "FASIML"

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario:  0307B3 - Left Panel management - right top bar - How to expand / collapse the hierarchical left list

        #Open function by code
        Given the user opens the "GESTPE" function

        #Check the function is opened
        Then the "Accounting entry types" screen is displayed

        #Left panel: select the main Hierarchical left list
        Given the user selects the main hierarchical panel of the screen
        And the user selects the data table of left panel

        #Left panel: expand the hierarchical left list
        When the user clicks the "Expand all" button in the left top bar of the selected data table
        And the user waits 1 seconds

        #Left panel: collapse the hierarchical left list
        When the user clicks the "Collapse all" button in the left top bar of the selected data table
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario:  0307B4 - Left Panel management - right top bar - How to move to the previous / next page of the hierarchical left list

        #Open function by code
        Given the user opens the "GESTPE" function

        #Check the function is opened
        Then the "Accounting entry types" screen is displayed

        #Left panel: select the main Hierarchical left list
        Given the user selects the main hierarchical panel of the screen
        And the user selects the data table of left panel

        #Left panel: go to the next page of the hierarchical left list
        When the user clicks the "Next" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Left panel: go to the previous page of the hierarchical left list
        When the user clicks the "Previous" button in the right top bar of the selected data table
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario:  0307B5 - Left Panel management - right top bar - How to maximize / minimize the hierarchical left list

        #Open function by code
        Given the user opens the "GESTPE" function

        #Check the function is opened
        Then the "Accounting entry types" screen is displayed

        #Left panel: select the main Hierarchical left list
        Given the user selects the main hierarchical panel of the screen
        And the user selects the data table of left panel

        #Left panel: maximize the hierarchical left list
        When the user clicks the "Maximize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Left panel: minimize the hierarchical left list
        When the user clicks the "Minimize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario: 0307B6 - Left Panel management - How to interact with the left table hierarchical panel

        #Open function by code
        Given the user opens the "GESRLK" function

        #Check the function is opened
        Then the "Bank statement entry" screen is displayed

        #Left panel: select the required data using the Table Hierarchical panel
        Given the user selects the table hierarchical panel of the screen
        When the user selects the data table of left panel
        Then the user selects first row of the selected data table
        And the user clicks on the selected row

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0307B7 - Logout scenario
        And the user logs-out from the system