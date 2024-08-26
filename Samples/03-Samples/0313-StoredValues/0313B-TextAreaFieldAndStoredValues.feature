###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313B-TextAreaFieldAndStoredValues
# - Description: How to interact with text area fields and (user) stored values
#                - How to write both text and stored value in a text area field and check its content
#                - How write both text and user stored value in a text area field and check its content
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313B-TextAreaFieldAndStoredValues

    Scenario: 0313B0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313B1 - Text area management - How to write both text and stored value in a text area field and check its content

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

        #Generate two dynamic sequences of 5 and 6 digits and store the values
        And the user stores the generated value with length 5 with the key "ENV_SEQ05"
        And the user stores the generated value with length 6 with the key "ENV_SEQ06"

        #Text area: selection of the text area field and write a value with the following text and stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        And the user writes "Project [ENV_SEQ05] approved for launch for amount of [ENV_SEQ06] USD" to the selected text area

        #Text area: selection of the text area field and check it contains a value defined with the following text and stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the value of the selected text area contains
            """
            Project [ENV_SEQ05] approved for launch for amount of [ENV_SEQ06] USD
            """

        #Text area: selection of the text area field and write block of text defined with the following text and stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the user writes block of text to the selected text area
            """
            Project approved for launch
            Project number [ENV_SEQ05]
            """

        And the user hits tab

        #Text area: selection of the text area field and check it contains a value defined with the following text and stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the value of the selected text area contains
            """
            Project number [ENV_SEQ05]
            """

        #Cancel the change of status
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel



    Scenario: 0313B2 - Text area management - How write both text and user stored value in a text area field and check its content

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

        #Text area: selection of the text area field and write a value with the following text and user stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        And the user writes "Project [USV_PROJECT_REFERENCE_01] approved for launch for amount of [USV_PROJECT_AMOUNT_01] USD" to the selected text area

        #Text area: selection of the text area field and check it contains a value defined with the following text and user stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the value of the selected text area contains
            """
            Project [USV_PROJECT_REFERENCE_01] approved for launch for amount of [USV_PROJECT_AMOUNT_01] USD
            """

        #Text area: selection of the text area field and write block of text defined with the following text and user stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the user writes block of text to the selected text area
            """
            Project approved for launch
            Project [USV_PROJECT_REFERENCE_01]
            """

        And the user hits tab

        #Text area: selection of the text area field and check it contains a value defined with the following text and user stored value
        Given the user selects the text field with X3 field name: "PJMEVEN_COMMEVEN"
        Then the value of the selected text area contains
            """
            Project [USV_PROJECT_REFERENCE_01]
            """

        #Cancel the change of status
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313B3 - Logout scenario
        And the user logs-out from the system