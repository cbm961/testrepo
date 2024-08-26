##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313G-LeftPanelAndStoredValues
# - Description: How to interact with left panel and (user) stored value
#                - How to interact with left panel and stored value - Method 1
#                - How to interact with left panel and stored value - Method 2
# - Created date: 17/09/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313G-LeftPanelAndStoredValues

    Scenario: 0313G0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313G1 - Left Panel management - How to interact with left panel and stored value - Method 1

        #Open function by code
        Given the user opens the "GESBSG" function


        And the user selects the text field with name: "Category"
        And the user writes "DE" to the selected text field and hits tab key
        And the user stores the value of the selected text field with the key: "ENV_BSGCOD1"

        And the user clicks the Close page action icon on the header panel

        #Open function by code
        Given the user opens the "GESBSG" function

        #Left panel: select the required data using the left list
        When the user clicks the "Supplier categories" link on the left panel
        Given the user selects the data table of left panel
        #Search cell: use the search cell to filter the Category using stored value
        Then the user selects search cell with header: "Category"
        And the user adds the text "[ENV_BSGCOD1]" in selected cell and hits enter key
        And the user selects cell with column header: "Category" and row number: 1
        And the user clicks on the selected cell

        #Verification the supplier category has been selected
        Given the user selects the text field with name: "Category"
        Then the value of the selected text field is "DE"

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313G2 - Left Panel management - How to interact with left panel and stored value - Method 2

        #Open function by code
        Given the user opens the "GESBSG" function


        And the user selects the text field with name: "Category"
        And the user writes "US" to the selected text field and hits tab key
        And the user stores the value of the selected text field with the key: "ENV_BSGCOD2"

        And the user clicks the Close page action icon on the header panel

        #Open function by code
        Given the user opens the "GESBSG" function

        #Left panel: select the required data using the left list
        When the user clicks the "Supplier categories" link on the left panel
        Given the user selects the data table of left panel
        #Search cell: use the search cell to filter the Category using stored value
        Then the user selects search cell with header: "Category"
        And the user adds the stored text with key "ENV_BSGCOD2" in selected cell and hits enter key
        And the user selects cell with column header: "Category" and row number: 1
        And the user clicks on the selected cell

        #Verification the supplier category has been selected
        Given the user selects the text field with name: "Category"
        Then the value of the selected text field is "US"

        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313G3 - Logout scenario
        And the user logs-out from the system