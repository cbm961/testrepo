###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314R-PickingListStateVerification
# - Description: How to check the (data table) picking list of the left panel is empty
#                - How to check the data table picking list of the left panel is empty
#                - How to check the hierarchical picking list of the left panel is empty
# - Created date: 12/08/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314R-PickingListStateVerification

    Scenario: 0314R0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314R1 - Left Panel management - How to check the data table picking list of the left panel is empty

        Given the user opens the "GESSDH" function

        #Select delivery transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "NA021" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "NA021" to the selected text field and hits tab key

        #Left panel: Check the data table picking list of the left panel is empty
        Given the user clicks the "Pick ticket selection" link on the left panel
        When the user selects the data table of left panel
        And the user selects search cell with header: "Pick ticket"
        And the user adds the text "NotExistingValue" in selected cell and hits enter key
        Then the selected data table of the left panel is empty

        And the user clicks the "Cancel" main action button on the right panel

        And the user clicks the Close page action icon on the header panel


    Scenario: 0314R2 - Left Panel management - How to check the hierarchical picking list of the left panel is empty

        Given the user opens the "GESSDH" function

        #Select delivery transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        #Left panel: Check the hierarchical picking list of the left panel is empty
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen
        Then the selected picking list of the left panel is empty

        And the user clicks the Close page action icon on the header panel


    Scenario: 0314R3 - Logout scenario
        And the user logs-out from the system