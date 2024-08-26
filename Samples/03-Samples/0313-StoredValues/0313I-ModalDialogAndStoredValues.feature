##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0313I-ModalDialogAndStoredValues
# - Description: How to interact with modal dialog pages with (user) stored values
#                - How to interact with modal dialog pages using both text and stored value
# - Created date: 17/09/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0313I-ModalDialogAndStoredValues

    Scenario: 0313I0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0313I1 - Modal Dialog page management - How to interact with modal dialog pages using both text and stored value

        #Open function by code
        Given the user opens the "GESMFG" function

        #Select Work order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Work orders ALL : Full entry" screen is displayed

        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Work order" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the text "WOATP21" in selected cell and hits enter key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

        #Stored value: Save the work order reference into a stored value
        And the user selects the text field with name: "Work order"
        And the user stores the value of the selected text field with the key: "ENV_MFGNUM01"

        #Open the header drop down
        When the user opens the header drop down
        When the user opens the "Option" section on the right panel
        And the user clicks the "Sub-con situation" action button on the header drop down

        #Modal dialog: check the modal dialog using both text and stored value
        Then the modal dialog "Released product situation Work Order [ENV_MFGNUM01]" is displayed

        #Stored value: check the value of the work order refence corresponds to the stored value.
        And the user selects the text field with name: "Work order"
        And the value of the selected text field is "[ENV_MFGNUM01]"

        #Close the modal dialog
        And the user clicks the Close page action icon on the header panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0313I2 - Logout scenario
        And the user logs-out from the system