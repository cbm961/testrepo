##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0310A-LogPanelManagement
# - Description: How to interact with log panel
#                - How to interact with log panel
#                - How to check the log contains a text pattern
#                - How to verify the number of rows returned in a log
# - Created date: 19/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0310A-LogPanelManagement

    Scenario: 0310A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0310A1 - Log Panel management - How to interact with log panel

        #Open function by code
        Given the user opens the "FUNPTH" function

        Then the modal dialog "Invoice receivables" is displayed

        #Set criteria
        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field
        And the user selects the text field with name: "From supplier"
        And the user writes "NA052" to the selected text field and hits tab key
        And the user selects the date field with name: "Until"
        And the user writes last day of month to the selected date field
        And the user selects the radio buttons group with name: "Generation type"
        And the user clicks on "Active simulation" radio button of the selected radio buttons group
        And the user selects the text field with name: "Entry type"
        And the user writes "GENSM" to the selected text field
        And the user selects the date field with name: "Entry date"
        And the user writes last day of month to the selected date field
        And the user selects the check box with name: "Log file"
        And the selected check box is checked

        Then the user clicks the "OK" button in the header

        #Log panel: check a log is displayed
        Given a log panel appears

        #Log panel: selection of the main log panel
        When the user selects the main log panel of the page

        #Log panel: set number of rows to the required number
        Then the user sets rows in log panel to display to 500

        #Log panel: check the log file contains the required message
        Then the selected log panel includes the message "Products to be processed All products"

        #Log panel: check the log contains the required error message
        Then the selected log panel includes the error message "No document to process"


    Scenario: 0310A2 - Log Panel management - How to check the log contains a text pattern

        #Check the log contains a text pattern
        Given the user selects the main data table of the page
        When the user selects row that has the text "Products" in column with X3 field name: "LECFIC_LIGNE"
        Then the user selects cell with X3 field name: "LECFIC_LIGNE" of selected row
        Then the value of the selected cell has string pattern "*to be processed*"


    Scenario: 0310A3 - Log Panel management - How to verify the number of rows returned in a log

        #Log panel: selection of the main log panel
        When the user selects the main log panel of the page

        #Log panel: verify the number of rows returned in the log
        Then the number of rows returned in the log panel is "26 Results"

        #Close the log
        And the user clicks the Close page action icon on the header panel


    Scenario: 0310A4 - Logout scenario
        And the user logs-out from the system