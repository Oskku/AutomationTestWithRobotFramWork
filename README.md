# README: Learning Testing with Robot Framework

This repository contains a test suite for learning to use Robot Framework, a popular open-source automation framework for acceptance testing and robotic process automation (RPA).

The test suite focuses on validating the login form and shopping cart functionality of a sample e-commerce website.

## Test Suite Structure

The test suite is divided into the following sections:

1. **Settings**: Imports required libraries and resources, and defines test setup and teardown procedures.
2. **Variables**: Defines variables used throughout the test suite.
3. **Tasks**: Defines the test cases to be executed.
4. **Keywords**: Defines custom keywords to simplify and modularize the test suite.

## Test Cases

Two main test cases are included in the test suite:

1. **Validate Unsuccessful Login Form**: This test case verifies that the login form displays an appropriate error message when an incorrect username or password is entered.
2. **Validate Successful Login Form with Shopping Cart**: This test case verifies that the login form successfully logs in the user when valid credentials are provided, and the user can interact with the shopping cart.

## Keywords

Custom keywords are defined to simplify the test cases and improve maintainability:

1. `Fill the login form`: Fills the login form with the provided username and password and clicks the login button.
2. `Wait until error message is displayed`: Waits for the error message to be visible on the page.
3. `Verify error message is correct`: Asserts that the error message matches the expected text.
4. `Validate cart titles in the shop`: Checks that the cart titles match the expected list of products and performs shopping cart actions.
5. `Select the card`: Selects a product card based on the provided product name.
6. `Wait for navigation link to be visible`: Waits for the navigation link to become visible on the page.
7. `Wait for total price to be displayed`: Waits for the total price of the selected items to be displayed.

## Prerequisites

1. Install Python: Download and install Python from the official [Python website](https://www.python.org/downloads/).
2. Install Robot Framework: Run the following command to install Robot Framework using `pip`:

   ```
   pip install robotframework
   ```

3. Install SeleniumLibrary: Run the following command to install the SeleniumLibrary for Robot Framework:

   ```
   pip install robotframework-seleniumlibrary
   ```

## Running the Test Suite

1. Open a terminal or command prompt.
2. Navigate to the directory containing the test suite.
3. Run the following command to execute the test suite:

   ```
   python run_robot_tests.py
   ```

This command will run the test suite and generate an HTML report with the test results.
