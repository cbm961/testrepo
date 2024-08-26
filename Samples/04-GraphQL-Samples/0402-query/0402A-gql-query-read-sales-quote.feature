###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: 0402A-gql-query-read-sales-quote
# - Description:  GraphQL Query
#                 - read sales quote
# - Created date:  06/02/2024
# - Updated dates: 04/03/2024
###########################################################################

@GraphQL_Test
Feature: 0402A-gql-query-read-sales-quote

    Scenario: Login scenario and connect
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected
        And the user opens the application on a desktop using the following link: "/xtrem/explorer/"

    Scenario: Load query request: Read sales quote FR0111507SQD00000001
        When the user writes "./0402A-gql-query-read-sales-quote-request.graphql" GraphQL request
        And the user clicks the "Run" button in the GraphQL page header

    Scenario: Validate GraphQL response
        Then the "./0402A-gql-query-read-sales-quote-response.json" GraphQL response is valid

    Scenario: The user logs out
        When the user logs-out from the system