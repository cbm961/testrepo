##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0306A-RightPanelMainActionManagement
# - Description: How to interact with the main action of the right panel
#                - How to interact with the main action of the right panel
# - Created date: 17/02/2020
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0306A-RightPanelMainActionManagement

    Scenario: 0306A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0306A1 - Right panel action management - How to interact with the main action of the right panel

        #Open function by code
        Given the user opens the "GESCPY" function

        And the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key

        #Right panel action: example to enter in creation mode
        Given the user clicks the "New" main action button on the right panel

        #Right panel action: cancel the creation
        Then the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0306A2 - Logout scenario
        And the user logs-out from the system