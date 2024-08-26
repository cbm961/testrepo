##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0307A-LeftPanelManagement
# - Description: How to interact with left panel
#                - How to interact with left panel
#                - How to clear the left list filter
#                - How to move to the previous / next page of the left list
#                - How to maximize / minimize the left list
# - Created date: 20/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0307A-LeftPanelManagement

    Scenario: 0307A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0307A1 - Left Panel management - How to interact with left panel

        #Open function by code
        Given the user opens the "GESBSG" function

        #Check the function is opened
        Then the "Supplier category" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Supplier categories" link on the left panel
        Given the user selects the data table of left panel

        #Search cell: use the search cell to filter the Category
        And the user selects search cell with header: "Category"
        And the user adds the text "US" in selected cell and hits enter key
        And the user selects cell with column header: "Category" and row number: 1
        And the user clicks on the selected cell

        #Verification the supplier category has been selected
        Given the user selects the text field with name: "Category"
        Then the value of the selected text field is "US"

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0307A2 - Left Panel management - left top bar - How to clear the left list filter

        #Open function by code
        Given the user opens the "GESBSG" function

        #Check the function is opened
        Then the "Supplier category" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Supplier categories" link on the left panel
        Given the user selects the data table of left panel

        #Search cell: use the search cell to filter the left list
        And the user selects search cell with header: "Category"
        And the user adds the text "US" in selected cell and hits enter key

        #Left panel: clear the left list filter
        When the user clicks the "Clear filter" button in the left top bar of the selected data table

        And the user clicks the Close page action icon on the header panel


    Scenario:  0307A3 - Left Panel management - right top bar - How to move to the previous / next page of the left list

        #Open function by code
        Given the user opens the "GESBIS" function

        #Check the function is opened
        Then the "Supplier BP invoice" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Supplier BP invoices" link on the left panel
        Given the user selects the data table of left panel

        #Left panel: go to the next page of the left list
        When the user clicks the "Next" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Left panel: go to the previous page of the left list
        When the user clicks the "Previous" button in the right top bar of the selected data table
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario:  0307A4 - Left Panel management - right top bar - How to maximize / minimize the left list

        #Open function by code
        Given the user opens the "GESBIS" function

        #Check the function is opened
        Then the "Supplier BP invoice" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Supplier BP invoices" link on the left panel
        Given the user selects the data table of left panel

        #Left panel: maximize the left list
        When the user clicks the "Maximize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        #Left panel: minimize the left list
        When the user clicks the "Minimize" button in the right top bar of the selected data table
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario: 0307A5 - Logout scenario
        And the user logs-out from the system