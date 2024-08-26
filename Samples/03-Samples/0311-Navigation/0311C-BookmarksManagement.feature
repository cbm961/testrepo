##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0311C-BookmarksManagement
# - Description: How to interact with bookmarks
#                - How to interact with bookmarks
# - Created date: 02/03/2020
# - Updated date: 29/01/2024
###########################################################################


@SageX3AutomatedTestPlatform
Feature: 0311C-BookmarksManagement

    Scenario: 0311C0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0311C1 - Navigation management - How to interact with bookmarks

        #Open function by code
        Given the user opens the "GESBPS" function
        Then the "Supplier" screen is displayed

        #Bookmarks: add the supplier functionality to the bookmarks list
        When the user clicks on Bookmark icon to add the screen to favorites
        Then the user clicks the Close page action icon on the header panel

        #Bookmarks: open the favorites Bookmarks toolbar and check the toolbar is not collapsed
        When the user opens the "Show Favorites toolbar" entry of Bookmark dropdown panel
        Then the favorites toolbar is present
        Then the favorites toolbar is not collapsed

        #Bookmarks: open the supplier functionality using the supplier entry of the bookmark main panel
        Given the user opens the "Supplier" entry of Bookmark main panel
        Then the "Supplier" screen is displayed
        And the user clicks the Close page action icon on the header panel

        #Bookmarks: hide the favorites bookmarks toolbar and check the toolbar is collapsed
        Given the favorites toolbar is present
        When the user opens the "Hide Favorites toolbar" entry of Bookmark dropdown panel
        Then the favorites toolbar is not present

        Given the user opens the "GESBPS" function
        Then the "Supplier" screen is displayed

        #Bookmarks: remove the supplier functionality from the bookmark list
        When the user clicks on Bookmark icon to remove the screen of favorites
        And the user clicks the Close page action icon on the header panel

        #Bookmarks: check When the bookmarks list is empty, the favorite toolbar is not present
        Then the favorites toolbar is not present


    Scenario: 0311C2 - Logout scenario
        And the user logs-out from the system