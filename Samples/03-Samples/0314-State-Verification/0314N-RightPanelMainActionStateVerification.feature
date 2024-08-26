##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0314N-RightPanelMainActionStateVerification
# - Description: How to check the state of the right panel main action
#                - How to check the right panel main action is enabled or disabled
# - Created date: 23/09/2021
# - Updated date: 23/03/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0314N-RightPanelMainActionStateVerification

    Scenario: 0314N0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0314N1 - Right panel action management - How to check the right panel main action is enabled or disabled

        #Open function by code
        Given the user opens the "GESCPY" function

        Then the user selects the text field with name: "Company"
        And the user writes "ATP2" to the selected text field and hits tab key

        #Right panel action: example to enter in creation mode
        Given the user clicks the "New" main action button on the right panel

        #Right panel action: check the main action is enabled
        Then the "Create" main action button on the right panel is enabled

        #Right panel action: check the main action is disabled
        Then the "Save" main action button on the right panel is disabled

        #Right panel action: cancel the creation
        And the user clicks the "Cancel" main action button on the right panel

        #Close the function
        And the user clicks the Close page action icon on the header panel


    Scenario: 0314N2 - Logout scenario
        And the user logs-out from the system