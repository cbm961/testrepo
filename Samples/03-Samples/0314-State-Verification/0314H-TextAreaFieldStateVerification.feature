###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314H-TextAreaFieldStateVerification
# - Description: How to check the state of a text area field
#                - How to check a text area field is displayed or hidden
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314H-TextAreaFieldStateVerification

    Scenario: 0314H0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314H1 - Text area management - How to check a text area field is displayed or hidden

        #Open function by code
        Given the user opens the "GESPJM" function
        Then the "Project management" screen is displayed

        #Left panel: select the required project using the left list
        Given the user selects the data table of left panel
        When the user clicks the "List of projects" link on the left panel
        Then the user selects search cell with header: "Project"
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Project" and row number: 1
        And the user clicks on the selected cell

        And the user clicks the "Change status" button in the header

        #Text area field: verify the text area field with X3 field Name (ScreenCode_FieldName) is displayed
        Then the text field with X3 field name: "PJMEVEN_COMMEVEN" is displayed

        #Text area field: verify the text area field with X3 field Name (ScreenCode_FieldName) is hidden
        Then the text field with X3 field name: "PJMEVEN_HDFIELD" is hidden


        #Cancel the change of status
        Then the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314H2 - Logout scenario
        And the user logs-out from the system