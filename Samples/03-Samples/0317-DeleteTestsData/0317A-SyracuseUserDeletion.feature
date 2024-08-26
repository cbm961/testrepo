##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0317A-SyracuseUserDeletion
# - Description: Delete a syracuse user
# - Created date: 05/04/2022
# - Updated date: 27/02/2023
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 0317A-SyracuseUserDeletion

    Scenario:  0317A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0317A1 - Delete a syracuse user

        #Open function by code
        Given the user opens the "Users" function
        Then the "Users" screen is displayed

        #Select the required user dans delete it
        When the user selects the main data table of the page
        And the user selects row that has the text "XATP" in column with header: "Login"
        And the user opens "Delete" function on toolbox of the selected row

        #Confirm the syracuse user deletion
        Then an alert box with the text "The XATP record will be deleted. Confirm?" appears
        And the user clicks the "Yes" option in the alert box

        #Verify that the user has been deleted
        Then a confirmation dialog appears containing the message "Resource has been deleted"

        And the user open the main page clicking on the logo


    Scenario: 0317A2 - Logout scenario
        Then the user logs-out from the system