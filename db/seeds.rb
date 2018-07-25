# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(name: 'user1', email: 'user1@example.com', password: 'password').save
User.new(name: 'user2', email: 'user2@example.com', password: 'password').save
User.new(name: 'user3', email: 'user3@example.com', password: 'password').save
User.new(name: 'user4', email: 'user4@example.com', password: 'password').save
User.new(name: 'user5', email: 'user5@example.com', password: 'password').save
Job.create([
    {
        title: '買い物アプリのデザイナー募集',
        description: '筑波内のデパートやコンビニの位置情報や口コミを共有するサービスを開発します。¥n場所：筑波大学¥n日時：７月の土日 8:00~15:00',
        user_id: 1
    },
    {
        title: 'シューティングゲームに使う立ち絵がほしい',
        description: 'シューティングゲームに使う立ち絵が欲しいです。ゲームの詳細はhttps://example.comです。',
        user_id: 2
    },
    {
        title: '履修管理システムのプログラマを募集しています',
        description: '履修を管理するサービスを開発します。¥n場所：筑波大学中央図書館¥n日時：８月の３，４，５，６，９ 12:00~21:00',
        user_id: 2
    }
    ])
Assign.create([
    {
        job_id: 0,
        user_id: 3,
        status: 'join'
    },
    {
        job_id: 2,
        user_id: 3,
        status: 'join'
    },
    {
        job_id: 2,
        user_id: 4,
        status: 'join'
    },
    {
        job_id: 2,
        user_id: 5,
        status: 'join'
    },
])
Chat.create([
    {
        job_id: 2,
        from_id: 3,
        to_id: 2,
        message: "中学生でも可ですか"
    },
    {
        job_id: 2,
        from_id: 2,
        to_id: 3,
        message: "大丈夫です"
    },
    {
        job_id: 2,
        from_id: 3,
        to_id: 2,
        message: "よろしくおねがいします"
    },
    {
        job_id: 2,
        from_id: 2,
        to_id: 3,
        message: "よろしくおねがいします〜"
    },
    {
        job_id: 0,
        from_id: 3,
        to_id: 1,
        message: "10:00~でも可能ですか"
    },
    {
        job_id: 0,
        from_id: 1,
        to_id: 3,
        message: "ちょっと難しいです"
    }
])