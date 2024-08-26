##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0304Q-DataTableCellColorManagement
# - Description: How to verify the text or background color of a cell
#                - How to verify the text color of a cell
#                - How to verify the background color of a cell
# - Created date: 18/03/2021
# - Updated date: 09/10/2023
###########################################################################

@SageX3AutomatedTestPlatform @TakeScreenshot
Feature: 0304Q-DataTableCellColorManagement

    Scenario: 0304Q0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0304Q1 - Data Table management - How to verify the text color of a cell

        Given the user opens the "GESASY" function
        And the user selects the main data table of the page
        And the user sets rows to display to 1000

        #Control the text color of the cell is red
        When the user selects row that has the text "AWARN" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Red"
        Then the color of the text in the selected cell is "red"
        Then the color of the text in the selected cell is "#FF0000"
        Then the color of the text in the selected cell is "#ff0000"
        And the user takes a screenshot

        #Control the text color of the cell is blue
        When the user selects row that has the text "AWARNLOW" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Blue"
        Then the color of the text in the selected cell is "#0000FF"
        And the user takes a screenshot

        #Control the text color of the cell is green
        When the user selects row that has the text "NUL" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Green"
        Then the color of the text in the selected cell is "#008000"
        And the user takes a screenshot

        When the user selects row that has the text "PJMCOMPG" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Green"
        Then the color of the text in the selected cell is "#00C605"
        And the user takes a screenshot

        #Control the text color of the cell is orange
        When the user selects row that has the text "NTRANSLATE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Orange"
        Then the color of the text in the selected cell is "#FFE7A8"
        And the user takes a screenshot

        #Control the text color of the cell is black
        When the user selects row that has the text "TRACE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Black"
        Then the color of the text in the selected cell is "#000000"
        And the user takes a screenshot

        #Control the text color of the cell is grey
        And the user selects row that has the text "PJMNEW" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        And the color of the text in the selected cell is "Grey"
        And the color of the text in the selected cell is "#333333"
        And the user takes a screenshot

        #Control the text color of the cell is cyan
        When the user selects row that has the text "FORCAGE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the text in the selected cell is "Cyan"
        Then the color of the text in the selected cell is "#008080"
        And the user takes a screenshot

        And the user clicks the Close page action icon on the header panel


    Scenario: 0304Q2 - Data Table management - How to verify the background color of a cell

        Given the user opens the "GESASY" function
        And the user selects the main data table of the page
        And the user sets rows to display to 1000

        #Control the backbround color of the cell is blue
        When the user selects row that has the text "CPYFLD" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Blue"
        Then the color of the background in the selected cell is "#78A7F5"
        And the user takes a screenshot

        When the user selects row that has the text "GDD3" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Blue"
        Then the color of the background in the selected cell is "#BDDCEC"
        And the user takes a screenshot

        When the user selects row that has the text "GDD3G" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Blue"
        Then the color of the background in the selected cell is "#AED8E8"
        And the user takes a screenshot

        And the user clicks the "Update..." secondary action button on the right panel

        #Control the backbround color of the cell is green
        When the user selects row that has the text "AEXPEXCTIT" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#008000"
        And the user takes a screenshot

        When the user selects row that has the text "AEXPEXCHVA" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#80FF80"
        And the user takes a screenshot

        When the user selects row that has the text "AEXPEXCTCO" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#008040"
        And the user takes a screenshot

        When the user selects row that has the text "AEXPEXC2" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#C8FA85"
        And the user takes a screenshot

        When the user selects row that has the text "AEXPEXCFOO" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#C7E39B"
        And the user takes a screenshot

        When the user selects row that has the text "BACKGREEN" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#B0FFB0"
        And the user takes a screenshot

        When the user selects row that has the text "CAZ" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#B9FFB9"
        And the user takes a screenshot

        When the user selects row that has the text "GDD2" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#C5F5C5"
        And the user takes a screenshot

        When the user selects row that has the text "GDD2G" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#B7F7B7"
        And the user takes a screenshot

        When the user selects row that has the text "INVRAPM" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#ECFBF0"
        And the user takes a screenshot

        When the user selects row that has the text "MTC2" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#C5F7C1"
        And the user takes a screenshot

        When the user selects row that has the text "MTOLINKA" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#D7E8B3"
        And the user takes a screenshot

        When the user selects row that has the text "MTOLINKB" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Green"
        Then the color of the background in the selected cell is "#EFF5E2"
        And the user takes a screenshot

        And the user clicks the "Update..." secondary action button on the right panel

        #Control the backbround color of the cell is yellow
        When the user selects row that has the text "PJMBUD" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Yellow"
        Then the color of the background in the selected cell is "#FFFFB0"
        And the user takes a screenshot

        And the user selects row that has the text "AEXPEXC1" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        And the color of the background in the selected cell is "Yellow"
        And the color of the background in the selected cell is "#FEFB81"
        And the user takes a screenshot

        When the user selects row that has the text "BACKORANGE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Yellow"
        Then the color of the background in the selected cell is "#FFE080"
        And the user takes a screenshot

        #Control the backbround color of the cell is orange
        When the user selects row that has the text "AERROR" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Orange"
        Then the color of the background in the selected cell is "#FF8040"
        And the user takes a screenshot

        When the user selects row that has the text "MTOLINKC" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Orange"
        Then the color of the background in the selected cell is "#FFD5C6"
        And the user takes a screenshot

        When the user selects row that has the text "NTRANSLATE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Orange"
        Then the color of the background in the selected cell is "#E3A180"
        And the user takes a screenshot

        #Control the backbround color of the cell is white
        When the user selects row that has the text "TRACE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        And the color of the background in the selected cell is "White"
        And the color of the background in the selected cell is "#FFFFFF"
        And the user takes a screenshot

        #Control the backbround color of the cell is grey
        When the user selects row that has the text "BACKGREY" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Grey"
        Then the color of the background in the selected cell is "#E0E0E0"
        And the user takes a screenshot

        #Control the backbround color of the cell is cyan
        When the user selects row that has the text "CTRLNSAI" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Cyan"
        Then the color of the background in the selected cell is "#D3FEFC"
        And the user takes a screenshot

        When the user selects row that has the text "LIGBUDA" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Cyan"
        Then the color of the background in the selected cell is "#77BBBB"
        And the user takes a screenshot

        When the user selects row that has the text "TFORCAGE" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Cyan"
        Then the color of the background in the selected cell is "#A7D8CD"
        And the user takes a screenshot

        When the user selects row that has the text "TWMWARN" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Cyan"
        Then the color of the background in the selected cell is "#80FFFF"
        And the user takes a screenshot

        And the user clicks the "Update..." secondary action button on the right panel

        #Control the backbround color of the cell is cyan
        When the user selects row that has the text "PJMWARN1" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Pink"
        Then the color of the background in the selected cell is "#FFB0B0"
        And the user takes a screenshot

        When the user selects row that has the text "GDD1" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Pink"
        Then the color of the background in the selected cell is "#FFE1E1"
        And the user takes a screenshot

        When the user selects row that has the text "GDD1G" in column with header: "Code"
        And the user selects cell with header: "Description" of selected row
        Then the color of the background in the selected cell is "Pink"
        Then the color of the background in the selected cell is "#FFCCCC"
        And the user takes a screenshot

        And the user clicks the Close page action icon on the header panel


    Scenario: 0304Q3 - Logout scenario
        And the user logs-out from the system