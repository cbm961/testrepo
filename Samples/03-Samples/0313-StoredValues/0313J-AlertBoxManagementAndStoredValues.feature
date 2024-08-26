##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313J-AlertBoxManagementAndStoredValue
# - Description: How to interact with alert box and value stored in memory
#                - How to interact with alert box and value stored in memory
# - Created date: 17/09/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313J-AlertBoxManagementAndStoredValues

    Scenario: 0313J0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313J1 - Message box management - How to interact with alert box and value stored in memory

        #Open function by code
        Given the user opens the "GESBIS" function

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Supplier BP invoices" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the text "PIDATP21*-000001" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        #Duplicate the invoice
        And the user selects the text field with name: "Document no."
        #Save the invoice reference in memory
        And the value of the selected text field is stored
        And the user writes "" to the selected text field and hits enter key

        #Alert box: check the alert box appear with the message containing the reference previously stored in memory
        Then an alert box with the text containing "Reference entered on invoice" and the stored text value appears

        #Alert box: Click on the Cancel action of the alert box
        And the user clicks the "Cancel" option in the alert box


        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313J2 - Logout scenario
        And the user logs-out from the system