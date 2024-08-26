##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0307C-PickingListManagement
# - Description: How to interact with picking list panel
#                - How to interact with a hierarchical picking list
#                - How to expand / collapse the picking list
#                - How to move to the previous / next page of the picking list
#                - How to maximize / minimize the picking list
#                - How to interact with a data table picking list
# - Created date: 20/02/2020
# - Updated date: 13/05/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0307C-PickingListManagement

    Scenario: 0307C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0307C1 - Left Panel management - How to interact with a hierarchical picking list

        #Open function by code
        Given the user opens the "GESSOH" function

        #Select sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Save the sales order reference in the stored value
        Given the user selects the data table of left panel
        When the user clicks the "Orders" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the text "ATP21" in selected cell
        Then the user selects search cell with header: "Delivery status"
        And the user adds the text "Not delivered" in selected cell and hits enter key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

        #Close the function
        And the user clicks the Close page action icon on the header panel

        #Open function by code
        Given the user opens the "GESSDH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Shipment site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "NA008" to the selected text field and hits tab key

        #Left panel: open the picking list and select the required order
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen

        #Left panel: Expand the picking list
        When the user clicks the "Expand all" button in the left top bar of the selected picking list

        #Left panel: select the required record
        And the user selects the item "BMS012 PCI E 128 Mb graphics adapter Remains to be delivered 4 UN" of the level 1 on the picking list panel

        #Picking of the selected item
        And the user checks the selected picking list panel item

        #Unpicking of the selected item
        And the user unchecks the selected picking list panel item

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0307C2 - Left Panel management - Left top bar - How to expand / collapse the picking list

        #Open function by code
        Given the user opens the "GESPAY" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "PAYWT USA Wire Transfer Issues" and column header: ""
        And the user clicks on the selected cell

        Then the "Wire Transfer Issues" screen is displayed

        #Switch to creation mode
        When the user clicks the "New" main action button on the right panel

        #Left panel: select the picking list
        Given the user clicks the "Grouped open items" link on the left panel
        When the user selects the main picking list panel of the screen

        #Left panel: expand the picking list
        When the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user waits 1 seconds

        #Left panel: collapse the picking list
        When the user clicks the "Collapse all" button in the left top bar of the selected picking list
        And the user waits 1 seconds

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0307C3 - Left Panel management - right top bar - How to move to the previous / next page of the picking list

        #Open function by code
        Given the user opens the "GESPAY" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "PAYWT USA Wire Transfer Issues" and column header: ""
        And the user clicks on the selected cell

        Then the "Wire Transfer Issues" screen is displayed

        #Left panel: select the picking list
        Given the user clicks the "Grouped open items" link on the left panel
        When the user selects the main picking list panel of the screen

        #Left panel: go to the next page of the picking list
        When the user clicks the "Next" button in the right top bar of the selected picking list
        And the user waits 1 seconds

        #Left panel: go to the next page of the picking list
        When the user clicks the "Previous" button in the right top bar of the selected picking list
        And the user waits 1 seconds

        And the user clicks the Close page action icon on the header panel


    Scenario: 0307C4 - Left Panel management - right top bar - How to maximize / minimize the picking list

        #Open function by code
        Given the user opens the "GESPAY" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "PAYWT USA Wire Transfer Issues" and column header: ""
        And the user clicks on the selected cell

        Then the "Wire Transfer Issues" screen is displayed

        #Switch to creation mode
        When the user clicks the "New" main action button on the right panel

        #Left panel: select the picking list
        Given the user clicks the "Grouped open items" link on the left panel
        When the user selects the main picking list panel of the screen

        #Left panel: maximize the picking list
        When the user clicks the "Maximize" button in the right top bar of the selected picking list
        And the user waits 1 seconds

        #Left panel: minimize the picking list
        When the user clicks the "Minimize" button in the right top bar of the selected picking list
        And the user waits 1 seconds

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0307C5 - Left Panel management - How to interact with a data table picking list

        #Open function by code
        Given the user opens the "GESPAY" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "RECWT USA Wire Transfer Receipts" and column header: ""
        And the user clicks on the selected cell

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "BP"
        And the user writes "NA003" to the selected text field and hits tab key

        #left Panel: open the picking left list and select the required document
        Given the user clicks the "Open items" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Number"
        And the user adds the text "DIR000022" in selected cell and hits enter key
        And the user selects cell with text: "DIR000022" and column header: "Number"
        And the user clicks on the selected cell

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0307C6 - Logout scenario
        And the user logs-out from the system