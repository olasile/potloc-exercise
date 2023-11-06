# README

This is the implementation of the Potloc technical exercise. The following features have been added to the technical exercise to demonstrate my seniority and facilitate the 1-hr technical discussion.

- Products and stores have been moved to the database level. Rather than storing the products and stores in arrays, I have moved them to the database. This allows for a more realistic user experience.
- I have added a search functionality for products. Products can be searched by name, and filtered by the store. Pagination has also been added. Each product shows its available amount, which is updated in real-time as users place orders.
- I have added the ability to add products to carts, adjust cart product quantities, and place orders.
- I have replaced the `websocketd` functionality with Rails' in-built ActionCable. This improves the code readability, and allows for a more robust implementation of the real-time inventory updates.
- Tests have been added using Rspec.

## Notes

- Run `rails db:seed` to generate stores, and products.
- The order notifications page displays new order info in real-time.
- The product search page updates the available amounts for each product in real-time.