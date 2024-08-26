###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314G-LinkFieldStateVerification
# - Description: How to check the state of a link field
#                - How to check an link field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314G-LinkFieldStateVerification

    Scenario: 0314G0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314G1 - Link field management - How to check an link field is displayed or hidden

        #Open function by Entity name
        Given the user opens the "Bank import settings" entity
        Then the "Bank import settings" screen is displayed

        When the user selects the main data table of the page
        Then the user selects row that has the text "ARLOCKBOX" in column with header: "Code"
        And the user selects cell with header: "Company" of selected row
        And the user clicks the "Display" option of the actions panel for the selected cell

        Then the user clicks the "General" tab selected by title

        #Link field: verify the link field with name is displayed
        Then the link field with name: "Country" is displayed

        #Link field: verify the link field with name is hidden
        Then the link field with name: "Hiddenfield" is hidden


    Scenario: 0314G2 - Logout scenario
        And the user logs-out from the system