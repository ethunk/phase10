### Introduction

It is no doubt that you have seen **User Stories** throughout the curriculum here at Launch. In this article, we will learn why we spend time creating user stories, what makes a good user story, how to extract **Acceptance Criteria** from a user story. To make this concept stick, you will practice constructing user stories and acceptance criteria.

### Contents

A **User Story** is a simple mechanism that allows developers along with their stakeholders to define a feature that should be built into a piece of software. This narrative will be translated into code and HTML to allow the sharing of goals in the development of projects.

In application development, user stories have a special importance because they provide a means to communicate about software without involving code. If your client can't appraise the code itself, they can at least compare the functional result with the expectations laid out in user stories. We use user stories as a means to communicate with nontechnical stakeholders about software. As you move further into implementing software, making changes becomes increasingly time consuming and costly. Having conversations around user stories, before code is written, saves time and money.

This is of greater importance than some developers are prepared to admit. Stereotypically, developers have a bad reputation of ignoring what the client intended, and is prepared to invest in. As a Launcher, you will discover the importance of communication around software.

While there are projects without a formally defined client, its a good idea to use user stories to ensure that the essential features of the application to be captured at the outset. The problem of feature creep can be counteracted if there's a way to capture and reference initial goals.

### Learning Goals

* Write an initial user story
* Define a task in terms of user stories

### External Resources

* [INVEST in Good User Stories](http://launchware.com/articles/invest-in-good-user-stories)

### Implementation Details

#### What information goes in a user story?

A good user story contains three key pieces of information about a feature or task: the **who**, the **what**, and the **why**.

Consider this statement:

```no-highlight
You should be able to call a supervisor
```

What does this statement indicate? Clearly, that in some context, someone should be able to perform a familiar act: calling a person who is in a supervisory role. But questions remain: Who is "you"? In what context are "you" calling the supervisor, and why?

Now consider this statement:

```no-highlight
A Toll Booth operator should be able to call a supervisor
```

This statement is quite different, in terms of the context that is provided. We actually know a lot more now, and we can assume some things: in the second statement, we know *who* is making the call (the Toll Booth operator) and we can guess that the supervisor referred to is the operator's supervisor. But we still don't know *why* the operator might be making that call.

Now consider this statement:

```no-highlight
When the coin receiver is broken, a Toll Booth operator should be able to call their supervisor
```

More context! We've defined the relationship between the person taking the action and the person called more precisely, and the circumstances that would provoke a call.

Finally, what's supposed to happen when that call happens? This might address that ambiguity:

```no-highlight
Toll Booth operators should make a repair request to their supervisor by telephone when a
coin receiver is found to be broken.
```

Most of the ambiguities have been squeezed out of this statement. Now think about these statements as stages in a consultation process with the Highway Authority, revamping their operations procedures. It's very unlikely that the first thing out of the mouth of the Head of Toll Booths is going to be that last statement. In stages, we identify:

* Who is involved
* What the circumstances are for the involved parties
* What they want to accomplish
* Why they want to accomplish it

#### Writing the user story

A user story for this might look like:

```no-highlight
As a Toll Booth Operator
I want to phone in a broken coin receiver to my supervisor
So that a Repair Procedure can be initiated
```

This three-line form is the ideal user story format. It states:

* who is the actor in the first line (the role);
* what action or procedure we are concerned with (the function), including who or what is affected; and
* states why, or what the ultimate goal (the business value) of this operation or procedure is.

**Quick Challenge:** Flesh out these statements into properly formed user stories. Challenge yourself to write only one.

**1st Scenario**: The books in the library that people have finished looking at should be put back where they need to go.

**2nd Scenario**: You win at Scrabble when someone's tiles are used up, and you have the highest score.

**3rd Scenario**: People can't just barge into a roundabout, they have to make sure that the coast is clear.

As soon as you begin, you'll find that you're asking questions about what's supposed to happen. In the case of a game like Scrabble, you might know pretty well what the rules are: in other cases, it might be a bit harder. Consider that these are exactly the kinds of questions that need to be answered by clients, and those with **domain knowledge** of the tasks that you'll be writing applications to address. Domain knowledge typically means valid knowledge around a specialized discipline or task.

How many of these tasks would have been better with more than one user story?

User stories have a way of leading to other user stories. Going back to our Toll Booth example, we might wonder what happens in that repair procedure. Who gets the report? How do they prioritize them? How do they report back that things are underway? All of these are new user stories, or perhaps several user stories.

---

### Acceptance Criteria

User stories are, by definition, somewhat imprecise: they favor brevity over precision, because we want easily understood stories that non-technical and technical project participants can agree upon.

*Note*: There is a school of thinking that says that stakeholders, not technicians, should write user stories. In reality, statements like the one preceding the first user story provided is as much as you'll get in most cases. While it captured the essentials, translating it to the formal user story requires more thought and effort.

Typically, you'll share the user stories you develop with your stakeholder before proceeding, and get sign-off on them. Once that's done, you'll develop acceptance criteria. These are more precise statements that provide a basis for determining if code that is written actually achieves the goals contained in the user stories.

Returning to our Toll Booth user story, this might look like:

```no-highlight
As a Toll Booth Operator
I should be able to phone in a broken coin receiver to my supervisor
So that a Repair Procedure can be initiated

Acceptance criteria:

* The malfunction light on a coin receiver is illuminated
OR
* A report from a user is received and confirmed by manual testing
* The operator places a call to the shift-designated supervisor
* The supervisor notes the error in the log and files it before the end of the shift
* The filed report is sent by internal courier to the Repairs Department and placed in priority
```

*Note*: User stories have a three-line format: Acceptance criteria may be on multiple lines. In some cases, one set of acceptance criteria will involve several user stories. If this happens, or if your acceptance criteria are becoming very complex for a single story, see if you can break your user stories down further to simplify writing acceptance criteria.

---

### Rules to Follow

#### Follow the "As a...So that...I want" paradigm

It's important to identify the role, the function, and the business value with every user story. This will help you to take the next step in creating the Acceptance Criteria.

#### Almost never use `user` as the role

Try to identify the role better. Everyone is a user of software in the context of a software user story!

Bad Example:

```no-highlight
As a user
I want to sign in
So that I can gain access to the system
```

Better Example:

```no-highlight
As an unauthenticated user
I want to sign in
So that I can gain access to the system
```

The latter already hints that acceptance criteria for the story should mention that already authenticated users cannot sign in.

#### Create Acceptance Criteria With a User or Subject Matter Expert

Working with a subject matter expert, or even the end user of your program, establishing acceptance criteria will help to identify what's required to realize the business value that is desired through a user story.

#### Use Declarative Voice When Writing Acceptance Criteria

The purpose of acceptance criteria is to mandate an outcome. A story is not complete until all acceptance criteria are met.

#### Acceptance Criteria Should Not Include Technical Details

Leave the technical details to the developer. Discuss the **what** of the feature, not the **how**.

Bad Example:

```no-highlight
As an unauthenticated user
I want to sign in
So that I can access to the system

Acceptance Criteria:
* I follow a sign in link from the top right of the screen
* I am presented with a form that has two inputs and a green button
* The password input is of type 'password'
* I click that button and the page refreshes letting me know if I got in.
* If I didn't enter the right password, the field is red
* The password should not be stored in clear text
```

Better Example:

```no-highlight
As an unauthenticated user
I want to sign in
So that I can gain access to the system

Acceptance Criteria:
* There is an option to sign in on the page if I'm not already authenticated
* My password is not displayed as I enter it
* I must specify a valid email address
* If I've entered the right credentials, I receive an onscreen message that I'm signed in, and I've gained access to the system
* If I didn't enter valid credentials, I receive an error message and I am left unauthenticated
* If I'm already authenticated, I don't have the option to sign in
```

### Why This is Important

#### User stories are how we communicate about software

User stories are the currency of negotiation between development teams and product owners. We use them as a means to communicate about software without having to involve code. User stories will be a critical aspect of your breakable toy, and you will write user stories when scoping out new projects.

#### Acceptance Criteria Is How You Know Your Story Is Done

When implementing a user story, the acceptance criteria are your guiding light on how the functionality needs to behave. Without acceptance criteria, there would often be disagreement between the stakeholder and the development team around what it means to be "feature complete."

Use acceptance criteria to help with your estimation process, and as a means to evaluate your work when it is complete.
