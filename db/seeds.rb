# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # genres
  Genre.create!(
    [
      {
        genre_name: "スポンジケーキ"
      },
      {
        genre_name: "誕生日ケーキ"
      },
      {
        genre_name: "アイニバーサリーケーキ"
      },
    ]
  )

  Item.create!(
    [
      {
        genre_id: "1",
        name: "ショートケーキ",
        image: File.open("./app/assets/images/cake1.jpg"),
        introduction: "ショートケーキです。",
        price: "800",
        is_active: true,
      },
      {
        genre_id: "2",
        name: "ブルーベリーケーキ",
        image: File.open("./app/assets/images/cake2.jpg"),
        introduction: "ブルーベリーケーです。",
        price: "600",
        is_active: true,
      },
      {
        genre_id: "3",
        name: "キュウリケーキ",
        image: File.open("./app/assets/images/cake3.jpg"),
        introduction: "キュウリケーキです。",
        price: "1000",
        is_active: true,
      },
      {
        genre_id: "2",
        name: "ブロッコリーケーキ",
        image: File.open("./app/assets/images/cake4.jpg"),
        introduction: "ブロッコリーケーキです。",
        price: "800",
        is_active: true,
      }
    ]
  )