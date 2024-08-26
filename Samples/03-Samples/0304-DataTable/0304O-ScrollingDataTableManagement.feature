##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304O-ScrollingDataTableManagement
# - Description: How to interact with scrolling data table
#                - How to interact with scrolling data table
# - Created date: 05/03/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0304O-ScrollingDataTableManagement

    Scenario: 0304O0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304O1 - Data Table management - How to interact with scrolling data table

        #Open function by code
        Given the user opens the "GESSDH" function

        #Select shipment transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        And the user selects the text field with name: "Delivery no."
        And the user writes "SHPATP210001" to the selected text field and hits tab key

        And the user clicks the "Lines" tab selected by title

        #Data table: Scrolling data table selection by X3 field name
        Given the user selects the scrolling data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"
        When the user selects cell that may not be visible with column header: "Order no." and row number: 1
        Then the value of the selected cell is "SONATP210002"

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303O2 - Logout scenario
        And the user logs-out from the system