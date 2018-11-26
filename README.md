# Dependency injection on iOS
The code present in this repository refers to the dependency injection article, I wrote on Medium:

Part 1: https://medium.com/@fernandodelrio/dependency-injection-on-ios-part-1-4-8847f302b3d9

Part 2: https://medium.com/@fernandodelrio/dependency-injection-on-ios-part-2-4-359fe6800e90

Part 3: https://medium.com/@fernandodelrio/dependency-injection-on-ios-part-3-4-e85fe7e20de6

Part 4: https://medium.com/@fernandodelrio/dependency-injection-on-ios-part-4-4-ce3723d819d

I wrote this article to talk a little bit about the concepts of **Dependency Injection (DI)**. I start by talking about software **coupling** and how a **loose coupling** could improve your code **maintainability**, **reusability**, **scalability** and **testability**.

Then I introduce the concept of DI and how it helps to achieve loose coupling. Beyond that we see some libraries/fancy techinique to use it on iOS, like **Swinject**

Later we start writing some code in order to see the concepts being applied in practice. We created a small iOS application, with no architectural concerns and discuss how can we improve it. We refactore it using many techiniques like: **Protocol Extensions**, **Child view controllers**, moving **business logic** out of the **view** and the **controller**, moving the **UIViewController** to the **view** layer, also experimenting MVVM in the process.

In the end we converted a **massive view controller**, breaking it down into multiple **smaller pieces** with **well defined responsibilities**, with improved reusibility, scalability and maintainability.

Later we get this improved architecture and apply the concepts of DI, in order to improve its testabilities and implement as many tests as we ca figure out:

By using DI containers, it became easy to mock the components of our software without adding additional complexity. We create mocks for the **network code**. We create mocks for the view layer, so we can better test our **view model** and **model**. We create mocks for the **view model** layer, so we can test our **views** without any business rules.

Finally, we finish the series of articles by writing **unit tests** covering our business rules, **unit tests** covering view testing using **FBSnapshotTestCase**

During the process, we gathered **code coverage** to understand the progress we made when testing the application.

Hope you enjoy, these articles and provide some feedbacks if you wish, I will try to improve the articles based on them. I learnt a lot when writing these articles, so I hope I can learn from you too.

Thanks!
