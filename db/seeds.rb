User.create(username: 'example_user', email: 'user@example.com', password_digest: 'hashed_password')
Item.create(name: 'Salad', description: 'Fresh green salad', calories: 150, protein: 5, carbohydrates: 20, fat: 2, rating: 4)
Menu.create(week_start_date: '2024-10-01', breakfast_items: ['Pancakes', 'Oatmeal'], lunch_items: ['Sandwich', 'Salad'], dinner_items: ['Pasta', 'Steak'])
Review.create(user_id: 1, item_id: 1, rating: 5, review_text: 'Great salad!')
