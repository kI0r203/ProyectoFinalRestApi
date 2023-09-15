Feature: Employees endpoint
  Background: Employees endpoints should allow to get, create, update and delete employees

    @getAll
    Scenario: /employees should return all the employees
      Given I perform a GET to the employees endpoint
      Then I verify status code 200 is returned
      And I verify that the body does not have size 0

    @post
    Scenario: /create should create an employee
      Given I perform a POST to the create endpoint with the following data
        | Diego | 3500 | 26 |
        Then I verify status code 200 is returned
      And I verify that the body does not have size 0
      And I verify the following data in the body response
        | Diego | 3500 | 26 |



    @delete
    Scenario: /delete/{id} should delete an employee
      Given I DELETE a employee with the ID "23"
      Then I verify status code 200 is returned
      And I verify that the employee "23" was deleted

    @getByID
    Scenario: /employee/{id} should return the employee selected
      Given I GET a employee by ID "23"
      Then I verify status code 200 is returned
      And I verify that I obtain the employee 23

    @put
    Scenario: /update/{id} should update the employee
      Given I PUT a employee by ID "21"
        | Nicolas | 5743 | 20 |
      Then I verify status code 200 is returned
      And I verify the following data in the body response
        | Nicolas | 5743 | 20 |

    @putWithInvalidValues
    Scenario: /update/{id} should not update the employee
      Given I PUT a bad parameters employee by ID "21"
        |  |  |  |
      Then I verify status code 400 is returned





