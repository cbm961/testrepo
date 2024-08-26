###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0303F-DropdownListFieldManagement
# - Description: How to interact with drop-down list fields
#                - How to select a value in a drop-down list field and verify the value selected
# - Created date: 30/01/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0303F-DropdownListFieldManagement

    Scenario: 0303F0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0303F1 - Drop down list management - How to select a value in a drop-down list field and verify the value selected

        #Open function by code
        Given the user opens the "GESITM" function

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        And the user selects the text field with name: "Category"
        And the user writes "BMSOL" to the selected text field

        #Drop down list field: selection of the drop-down list by content, assigning and verifying the value selected
        #First value of the list starting with "Not" is selected
        Given the user selects the drop down list with name: "Product status"
        When the user clicks on "Not" option of the selected drop down list
        Then the value of the selected drop down list is "Not renewed"

        #Drop down list field: selection of the Drop down list with exact match, assigning and verifying the value selected
        Given the user selects the drop down list with name: "Product status"
        When the user clicks on option that matches exact with the text "Not usable" of the selected drop down list
        Then the value of the selected drop down list is "Not usable"

        #Drop down list field: selection of the Drop down list by X3 field name (ScreenCode_FieldName), assigning and verifying the value selected
        Given the user selects the drop down list with X3 field name: "ITM0_ITMSTA"
        When the user clicks on "Active" option of the selected drop down list
        Then the value of the selected drop down list is "Active"

        #Cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0303F2 - Logout scenario
        And the user logs-out from the system