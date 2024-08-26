##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313H-PickingListAndStoredValues
# - Description: How to interact with picking list panel and (user) stored value
#                - How to interact with a hierarchical picking list using stored value (string pattern method)
#                - How to interact with a hierarchical picking list using stored value (old method)
#                - How to interact with a data table picking list and stored value
# - Created date: 17/09/2021
# - Updated date: 06/04/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313H-PickingListAndStoredValues

    Scenario: 0313H0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313H1 - Left Panel management - How to interact with a hierarchical picking list using stored value (string pattern method)


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


        #Document: SONATP210001
        And the user selects the text field with name: "Number"
        And the user stores the value of the selected text field with the key: "ENV_ATPSOHNUM01"

        #Csutomer: NA008
        And the user selects the text field with name: "Sold-to"
        And the user stores the value of the selected text field with the key: "ENV_ATPBPCORD01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel

        #Open function by code
        Given the user opens the "GESSDH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Shipment site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "[ENV_ATPBPCORD01]" to the selected text field and hits tab key


        #Left panel: open the picking list
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen
        And the user clicks the "Expand all" button in the left top bar of the selected picking list

        #pattern selection using stored values
        And the user selects the item containing string pattern "[ENV_ATPSOHNUM01]*[ENV_ATPBPCORD01]*" of the picking list panel

        And the user expands the selected picking list panel item

        #pattern selection using user stored values and hard coded text
        And the user selects the item containing string pattern "[USV_ITMREF01]*[USV_ATPQTY01]*UN" of the picking list panel next level

        #Picking of the selected item
        And the user checks the selected picking list panel item

        #Unpicking of the selected item
        And the user unchecks the selected picking list panel item

        #Left panel: collapse the picking left list
        And the user clicks the "Collapse all" button in the left top bar of the selected picking list

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313H2 - Left Panel management - How to interact with a hierarchical picking list using stored value (old method)

        #Open function by code
        Given the user opens the "GESSDH" function

        #Select Sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Shipment site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "ATP21" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "NA008" to the selected text field and hits tab key


        #Left panel: open the picking list and select the required order defined in the stored value
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen
        And the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item with the stored text with key "ENV_ATPSOHNUM01" and with the text containing "NA008" of the picking list panel
        And the user expands the selected picking list panel item
        And the user selects the item "BMS012 PCI E 128 Mb graphics adapter Remains to be delivered 4 UN" of the picking list panel next level

        #Picking of the selected item
        And the user checks the selected picking list panel item

        #Unpicking of the selected item
        And the user unchecks the selected picking list panel item

        #Left panel: collapse the picking left list
        And the user clicks the "Collapse all" button in the left top bar of the selected picking list

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313H3 - Left Panel management - How to interact with a data table picking list and stored value

        #Open function by code
        Given the user opens the "GESBIC" function

        #Left panel: select the required data using the left list
        When the user clicks the "Customer BP invoice" link on the left panel
        Given the user selects the data table of left panel

        #Search cell: use the search cell to filter the Category
        Then the user selects search cell with header: "Site"
        And the user adds the text "ATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Site" and row number: 1
        And the user clicks on the selected cell

        #Document:DIR000022
        And the user selects the text field with name: "Document no."
        And the user stores the value of the selected text field with the key: "ENV_ATPBISNU04"

        #Close the function
        And the user clicks the Close page action icon on the header panel


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
        And the user adds the text "[ENV_ATPBISNU04]" in selected cell and hits enter key
        And the user selects cell with column header: "Number" and row number: 1
        And the user clicks on the selected cell

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313H4 - Logout scenario
        And the user logs-out from the system