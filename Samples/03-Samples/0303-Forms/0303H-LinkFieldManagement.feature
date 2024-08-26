###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303H-LinkFieldManagement
# - Description: How to interact with link fields
#                - How to interact with link fields in syracuse page
# - Created date: 27/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303H-LinkFieldManagement

    Scenario: 0303H0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303H1 - Link field management - How to interact with link fields in syracuse page

        #Open function by Entity name
        Given the user opens the "Bank import settings" entity
        Then the "Bank import settings" screen is displayed

        When the user selects the main data table of the page
        And the user selects row that has the text "ARLOCKBOX" in column with header: "Code"
        And the user selects cell with header: "Company" of selected row
        And the user clicks the "Display" option of the actions panel for the selected cell

        And the user clicks the "General" tab selected by title

        #Link field: select the link field by name and check its content
        Given the user selects the link field with name: "Country"
        Then the text of the selected link field is "US"
        And the description of the selected link field is "United States of America"

        #Link field: click on the Display action of the selected link field
        Given the user selects the link field with name: "Country"
        And the user clicks on "Display" button of the selected link field

        Then the "Country" screen is displayed
        And the user clicks the "General" tab selected by title

        #Link field: select the link field and click on it
        Given the user selects the link field with name: "Currency"
        And the user clicks on the selected link field

        Then the "Currencies" screen is displayed


    Scenario: 0303H2 - Logout scenario
        And the user logs-out from the system