# Order Up

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Overview

Order up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes.

* Chef's have many dishes
* Dishes belong to a chef
* Dishes have many Ingredients
* Ingredients have many dishes
* Ingredients should have a name and calories.

Some of the initial migrations and model set up has been done for you. After you set up your database, you should be able to run the tests and see five passing tests.

(Note: The plural of dish is dishes. The plural of chef is chefs.)

## User Stories

```
User Story 1 - Chef Show Page

As a visitor
When I visit a chef's show page
Then I see the name of the chef
And I see the names and descriptions of all the chef's dishes
```

```
User Story 2 - Chef's Ingredients

As a visitor
When I visit a chef's show page
Then I see the name and calories of all ingredients this chef uses in their dishes
And I see that the list of ingredients is unique (contains no duplicate ingredients)
And I see that the list of ingredients is ordered from most calories to least calories
```

```
User Story 3 - Destroy a Dish
As a visitor
When I visit a chef's show page
Then next to each dish I see a button to delete it
When I click this button
I am returned to the chef's show page
And I no longer see the dish listed
```


## Extensions

```
Extension - Chef's most popular ingredients

As a visitor
When I visit a chef's show page
I see a section for "Most Popular Ingredients"
And in that section I see the three most popular ingredients that the chef uses in their dishes
(Note: Popularity is based off of how many dishes use that ingredient)
(Note: You should only make 1 database query to calculate the most popular ingredients)
```
