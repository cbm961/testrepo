###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303B-TextFieldandDateManagement
# - Description: How to interact with text fields for date management
#                - How to enter a date in a text field
# - Created date: 30/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303B-TextFieldandDateManagement

    Scenario: 0303B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303B1 - Text field managment - How to enter a date in a text field

        #Open function by code
        Given the user opens the "DCLVATSPA1" function

        #Text field: returning current year & verifying value
        Given the user selects the text field with name: "Year"
        When the user writes the year to the selected text field
        Then the value of the selected text field is the current year

        #Text field: returning current tax year & verifying value
        Given the user selects the text field with name: "Year"
        When the user writes the current Tax year starting on "2020" to the selected text field
        Then the value of the selected text field is the current Tax year that starts on "2020"

        #To note other options are possible to calculate month , day or week

        #Text field: returning current month & verifying value
        Given the user selects the text field with name: "Year"
        When the user writes the month to the selected text field
        Then the value of the selected text field is the current month

        #Text field: returning current day & verifying value
        Given the user selects the text field with name: "Year"
        When the user writes the day to the selected text field
        Then the value of the selected text field is the current day

        #Text field: returning current week number & verifying value
        Given the user selects the text field with name: "Year"
        When the user writes the week number to the selected text field
        Then the value of the selected text field is the current week number

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303B2 - Logout scenario
        And the user logs-out from the system