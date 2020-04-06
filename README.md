# **LauzHack-CoVid19**

**Team:** Mohamed Elasfoury, Douglas Bouchet, Ludovic Burnier, Luke Patel, Lancelot Scheid, Clément Sicard

## **Concept:**

We have created a platform which allows people to have their shopping done for them and brought to them in their own homes. It is made to enable those most vulnerable to the virus to stay in their homes and still have access to all the necessary supplies. People who are looking to help others, or who are simply going to buy their own supplies can choose to pick up the groceries or medecin for others near them, using our platform.

## **Overview:**

We have created both a mobile app and a web app to make this possible. We coded the graphical interface, using Flutter. We are using FireBase as our backend and we have created an API using flutter to connect it to the frontend.

## **Graphical Interface:**
Both the web app and mobile application (Android and iOS), show a sign up/sign in page the first time they are opened. Once signed in, the application remains so until one chooses to sign out. On the first page shown of the application (once signed in), two buttons are displayed: one that reads "request help" and another that reads "offer help", below it.</p>
The "request help" button takes the user to another page, where they are given the option to create a shopping list, or to use a photo of a shopping list from their camera or gallery. The "create shopping list" option takes them to a page containing a list of different categories, and within each category a number of different products, which they can choose to add to their basket using a button to right of each product. There is a button in the top right corner of the screen which takes them to their basket, where they can remove items or confirm their list.</p>
The "offer help" button takes the user to a page which the displays the name and approximative location of those who have requested help. Tapping on any of these people takes the user to a page which displays their basket as a checklist, and in the top right corner, there is a button which allows a user to accept this request.

## **API:**
Our API uses Firebase's methods in order to store different information about the application's users, such as their contact information and their orders for instance. When an order is made, it is send to and stored in a specific location within the database. When a user accepts this order, it is moved from its location to another, where all accepted orders, and the information of those having accepted them are stored.