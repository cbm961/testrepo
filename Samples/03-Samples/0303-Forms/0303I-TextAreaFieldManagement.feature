###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303I-TextAreaFieldManagement
# - Description: How to interact with text area fields
#               - How to write text in a text area field and check its content
# - Created date: 03/03/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303I-TextAreaFieldManagement

    Scenario: 0303I0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303I1 - Text area management - How to write text in a text area field and check its content

        #Open function by code
        Given the user opens the "GESPJM" function
        Then the "Project management" screen is displayed

        #Left panel: select the required project using the left list
        Given the user selects the data table of left panel
        When the user clicks the "List of projects" link on the left panel
        And the user selects search cell with header: "Project"
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Project" and row number: 1
        And the user clicks on the selected cell

        And the user clicks the "Change status" button in the header

        #Text area: selection of the text area and write the required text
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        And the user writes "Project approved for launch" to the selected text area

        #Text area: selection of the text area and write block of text
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        And the user writes block of text to the selected text area
            """
            Project approved for launch
            Approved by project supervisor
            """

        And the user hits tab

        #Text area: selection of the text area field and check the the value it contained
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the value of the selected text area contains
            """
            Project approved for launch
            Approved by project supervisor
            """

        #Cancel the change of status
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303I2 - Logout scenario
        And the user logs-out from the system