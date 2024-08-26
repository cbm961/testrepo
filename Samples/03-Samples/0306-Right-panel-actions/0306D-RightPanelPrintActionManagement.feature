##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0306D-RightPanelPrintActionManagement
# - Description: How to interact with right panel print action
#                - How to interact with right panel print action
# - Created date: 18/02/2020
# - Updated date: 06/12/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0306D-RightPanelPrintActionManagement

    Scenario: 0306D0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0306D1 - Right panel action management - How to interact with right panel print action

        #Open function by code
        Given the user opens the "GESSIH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

        #Select the Sales invoices in the left list
        Given the user selects the data table of left panel
        When the user clicks the "Invoices" link on the left panel
        Then the user selects search cell with header: "Invoice no."
        #Search for ATP21*INVBC000001
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Invoice no." and row number: 1
        And the user clicks on the selected cell

        #Right panel action: click on print action and select the required option
        Given the user clicks the "Print" tool on the right panel and selects the "Record" option

        When the user selects the data table in the popup
        Then the user selects row that has the text "SBONFAC" in column with header: "Code"
        And the user clicks on the selected row

        And the user selects the text field with name: "Destination"
        And the user writes "PREVISU" to the selected text field and hits tab key

        #Launch the print
        Then the user clicks the "Print" secondary action button on the right panel

        #Print in progress
        Given the user waits for a report printout with message "Report available in storage area."

        #Print: check the information displayed on the tracker
        Then a tracker appears signalling completion
        Then the tracker has the job title "Customer invoice"
        Then the tracker has the phase "Job finished"
        Then the tracker has the message "Report available in storage area"

        #Print: dismiss the tracker
        And the user clicks to dismiss the tracker


        #Close the main function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0306D2 - Logout scenario
        And the user logs-out from the system