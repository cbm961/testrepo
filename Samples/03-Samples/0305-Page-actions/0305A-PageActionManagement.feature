##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0305A-PageActionManagement
# - Description: How to interact with header actions / buttons
#                - How to interact with header page actions / buttons
#                - How to move to the previous / next / first / last record of the page
# - Created date: 18/02/2020
# - Updated date: 13/05/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0305A-PageActionManagement

    Scenario: 0305A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0305A1 - Page action management - How to interact with header page actions / buttons

        #Open function by code
        Given the user opens the "GESBIC" function

        When the user selects the text field with name: "Document no."
        Then the user writes "DIR000022" to the selected text field and hits tab key

        #Page action: click on the header action
        Given the user clicks the "Open items" button in the header

        #Page action: click button in the popup header
        Then the user clicks the "OK" button in the header

        #Page action: click on the close page action on the header panel
        And the user clicks the Close page action icon on the header panel


    Scenario: 0305A2 - Page action management -  How to move to the previous / next / first / last record

        Given the user opens the "GESITM" function

        Then the "Product" screen is displayed

        #Left panel: select the left list
        When the user clicks the "Products" link on the left panel
        Given the user selects the data table of left panel

        #Search cell: use the search cell to filter the product
        And the user selects search cell with header: "Product"
        And the user adds the text "BMS001" in selected cell and hits enter key
        And the user selects cell with column header: "Product" and row number: 1
        And the user clicks on the selected cell

        #Page action: go to the next record
        When the user clicks the "Next" icon in the header
        And the user waits 1 seconds

        #Page action: go to the previous record
        When the user clicks the "Previous" icon in the header
        And the user waits 1 seconds

        #Page action: go to the last record
        When the user clicks the "Last" icon in the header
        And the user waits 1 seconds

        #Page action: go to the first record
        When the user clicks the "First" icon in the header
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario: 0305A3 - Logout scenario
        And the user logs-out from the system