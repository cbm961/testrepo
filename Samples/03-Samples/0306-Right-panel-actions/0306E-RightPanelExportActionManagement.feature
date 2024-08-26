##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0306E-RightPanelExportActionManagement
# - Description: How to interact with right panel export action
#                - How to interact with right panel export action
# - Created date: 22/06/2021
# - Updated date: 06/12/2022
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0306E-RightPanelExportActionManagement

    Scenario: 0306E0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0306E1 - Right panel action management - How to interact with right panel export action

        #Open function by code
        Given the user opens the "GESTCY" function

        When the user selects the text field with name: "Countries"
        And the user writes "US" to the selected text field and hits tab key

        #Right panel action: click on export action and select the required option
        When the user clicks the "Export" tool on the right panel and selects the "Data to Excel" option

        Then the output file "*OTCY*.csv" is created

        And the user clicks the Close page action icon on the header panel


    Scenario: 0306E2 - Logout scenario
        And the user logs-out from the system