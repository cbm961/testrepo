###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313C-TextEditorAndStoredValues
# - Description: How to interact with text editor fields and (user) stored values
#                - How to write both text and stored value in a text editor field and check its content
#                - How to write both text and user stored value in a text editor field and check its content
# - Created date: 12/08/2021
# - Updated date: 05/11/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313C-TextEditorAndStoredValues

    Scenario: 0313C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313C1 - Text editor management - How to write both text and stored value in a text editor field and check its content

        #Open function by code
        Given the user opens the "GESFPT" function
        Then the "Reminder texts" screen is displayed

        And the user selects the text field with name: "Language"
        And the user writes "ENG" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Reminder type"
        And the user clicks on "By invoice" option of the selected drop down list
        And the user selects the text field with name: "Reminder level"
        And the user writes "1" to the selected text field and hits enter key


        #Generate a dynamic sequence of 5 digits and store the value
        And the user stores the generated value with length 5 with the key "ENV_SEQ05"

        #Text editor: selection of the text editor field and write a value defined with the following text and stored value
        Given the user selects the text editor of section: "Header text"
        When the user writes block of text to the selected text editor
            """
            We would appreciate it if you would send us the corresponding payments of [ENV_SEQ05] USD
            """
        # And the user hits tab

        #Text editor: selection of the text editor field and check it contains the exact value defined with the following text and stored value
        Given the user selects the text editor of section: "Header text"
        Then the value of the selected text editor is
            """
            We would appreciate it if you would send us the corresponding payments of [ENV_SEQ05] USD
            """

        #Text editor: selection of the text editor field and check it contains a value defined with the following text and stored value
        Given the user selects the text editor of section: "Header text"
        Then the value of the selected text editor contains
            """
            the corresponding payments of [ENV_SEQ05]
            """

        #Cancel the modification
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313C2 - Text editor management - How to write both text and user stored value in a text editor field and check its content

        #Open function by code
        Given the user opens the "GESFPT" function
        Then the "Reminder texts" screen is displayed

        And the user selects the text field with name: "Language"
        And the user writes "ENG" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Reminder type"
        And the user clicks on "By invoice" option of the selected drop down list
        And the user selects the text field with name: "Reminder level"
        And the user writes "1" to the selected text field and hits enter key


        #Text editor: selection of the text editor field and write a value defined with the following text and user stored value
        Given the user selects the text editor of section: "Header text"
        When the user writes block of text to the selected text editor
            """
            We would appreciate it if you would send us the corresponding payments of [USV_PAYMENT_AMOUNT_01] USD
            """
        # And the user hits tab

        #Text editor: selection of the text editor field and check it contains the exact value defined with the following text and user stored value
        Given the user selects the text editor of section: "Header text"
        Then the value of the selected text editor is
            """
            We would appreciate it if you would send us the corresponding payments of [USV_PAYMENT_AMOUNT_01] USD
            """

        #Text editor: selection of the text editor field and check it contains a value defined with the following text and user stored value
        Given the user selects the text editor of section: "Header text"
        Then the value of the selected text editor contains
            """
            the corresponding payments of [USV_PAYMENT_AMOUNT_01]
            """

        #Cancel the modification
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313C3 - Logout scenario
        And the user logs-out from the system