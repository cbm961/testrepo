###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0401A-gql-mutation-time-entry-creation
# - Description:  GraphQL Mutation
#                 - Create time entry for ADMIN user
# - Created date:  04/03/2024
# - Updated dates:
###########################################################################

Feature: 0401A-gql-mutation-time-entry-creation

    Scenario: Login scenario and connect
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserRootName" and password "param:loginUserRootPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected
        And the user opens the application on a desktop using the following link: "/xtrem/explorer/"

    Scenario: Load mutation request: Create a time entry for ADMIN User / Project NA0131701000024
        When the user writes "./0401A-gql-mutation-time-entry-creation-request.graphql" GraphQL request
        And the user clicks the "Run" button in the GraphQL page header

    Scenario: Attach GraphQL actual response
        And the user attaches the actual GraphQL response to allure report

    Scenario: Get and Control GraphQL response Property

        When the user selects the "extensions.diagnoses[1].message" GraphQL property
        Then the selected GraphQL property value is not 'Error'
        Then the selected GraphQL property value is 'Operation completed successfully.'
        Then the selected GraphQL property value contains 'successfully'

        And the user takes a screenshot
