# React / Redux Take-home Assessment

Read this entire README before starting work on the project.

## Context

In a few weeks, you'll start to apply to jobs. A key part of the 
interview process at a lot of companies is a coding challenge. There 
are many different kinds of coding challenges, but one thing you'll 
commonly see is a slightly-vague set of instructions to build an app 
or method of some kind. This assessment is meant to mimic that kind 
of coding challenge.

We will be grading this assessment using concrete specifications 
(see the Grading section). However, you should use this assessment as 
a chance to practice for real coding challenges, in which simply 
getting to MVP may not get you to the next round of interviews. Here 
are a few suggestions for how to make a coding challenge really stick 
out to a company:

+ Styling: make the frontend professional and polished
+ Tests: write a few of your own tests, especially for the work you did 
(i.e., the frontend React stuff, not the backend Rails part)
+ Go beyond MVP: add something that's not asked for on the list, but 
stays somewhat within the scope of the app (e.g., a search feature, 
drag/drop, filtering, etc.)
+ Refactor: go back and make the code itself readable, clean, and DRY 
(employers DO look at your code for challenges)

## Instructions

In this project, you will build the frontend for an app that allows a
user to view, create, edit, and delete posts. We require that you
create three different pages:

+ an index page, showing: 
  + a list of posts; each list item should have:
    + that post's title
    + a link to that post's show page
    + a link to that post's edit page
    + a button to delete that post
  + a form to create new posts
+ a show page, showing one post
  + display that post's `title` and `body`
+ an edit page, allowing a user to edit a post's `title` and `body`

You are allowed to use outside resources, including websites like StackOverflow
and the App Academy curriculum, while working on this assessment. You are also
allowed to consult with your peers. However, **do not copy each other's work**.
We take violations of this very seriously.

**We estimate this to take between 4 to 8 hours depending on your comfort
with React and Redux.**

## Grading and Submission

### Grading

Your assessment will be scored out of 6 points. Each one of the following criteria,
if satisfactorily completed, will earn you one point.

1. Has a bug-free index page with the following functionality:
  + links to show and edit pages for each post
  + has buttons to delete individual posts
  + has form for creating new posts
2. Has a bug-free show page with the following functionality:
  + displays post title and body
3. Has a bug-free edit page with the following functionality:
  + has form for editing posts
4. Is built in React/Redux
  + no HTML rendered by Rails other than the root page
  + no redirects by Rails controllers
5. Is adequately styled
  + uses the layout provided by the wireframes
  + elements are given appropriate padding and margin
6. Has a git commit history of at least 20 commits

### Submission

Submit this assessment through ProgressTracker before 9am on Monday.

## Design Documents

* [View Wireframes][views]
* [Database Schema][db_schema]
* [API Endpoints][api_endpoints]

[db_schema]: ./docs/db_schema.md
[views]: ./docs/views.md
[api_endpoints]: ./docs/api_endpoints.md

## Setup

The (Rails) backend is entirely set up. A basic set of npm libraries
have been provided for you as well. Make sure that the following
commands run without errors before starting work on the project.

1. `git init`
2. `npm install`
3. `bundle install`
4. `bundle exec rake db:setup`
  - NB: you will need to have postgres running!

To test your code live in the browser, run:
1. `rails server`
2. `webpack --watch` (you will need to create a `frontend` folder and 
an entry file per the webpack config file in order to run this)
3. Navigate to localhost:3000.

Remember to initialize a git repository before getting to work.
