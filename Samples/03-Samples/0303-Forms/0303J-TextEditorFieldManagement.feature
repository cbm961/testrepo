###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303J-TextEditorFieldManagement
# - Description: How to interact with text editor fields
#                - How to write text in a text editor field and check its content
# - Created date: 03/03/2020
# - Updated date: 05/11/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303J-TextEditorFieldManagement

    Scenario: 0303J0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303J1 - Text editor management - How to write text in a text editor field and check its content

        #Open function by code
        Given the user opens the "GESFPT" function
        Then the "Reminder texts" screen is displayed

        And the user selects the text field with name: "Language"
        And the user writes "ENG" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Reminder type"
        And the user clicks on "By invoice" option of the selected drop down list
        And the user selects the text field with name: "Reminder level"
        And the user writes "1" to the selected text field and hits enter key

        #Text editor field: selection of the text editor field and write the required text
        Given the user selects the text editor of section: "Header text"
        When the user writes block of text to the selected text editor
            """
            Dear Madam or Sir,
            Unless we have made a mistake or omission, we have noted that the following invoices remain unpaid to this day
            Best regards,
            The accounting Department
            """
        # And the user hits tab

        Then the value of the selected text editor is
            """
            Dear Madam or Sir,
            Unless we have made a mistake or omission, we have noted that the following invoices remain unpaid to this day
            Best regards,
            The accounting Department
            """

        #Text editor field: selection of the text editor by X3 field name (ScreenCode_FieldName) and write the required text
        Given the user selects the text editor with X3 field name: "FPT1_TXT2"
        When the user writes block of text to the selected text editor
            """
            We would appreciate it if you would send us the corresponding payments upon receipt of this notice.
            Best regards,
            The accounting Department.
            """

        # And the user hits tab

        Then the value of the selected text editor contains
            """
            Best regards,
            The accounting Department.
            """

        #Cancel the modification
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303J2 - Logout scenario
        And the user logs-out from the system