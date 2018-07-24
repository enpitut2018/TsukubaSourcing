# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jobs = Job.create([
    {
        title: '買い物アプリのデザイナー募集',
        description: '筑波内のデパートやコンビニの位置情報や口コミを共有するサービスを開発します。¥n場所：筑波大学¥n日時：７月の土日 8:00~15:00',
        user_id: 0
    },
    {
        title: 'シューティングゲームに使う立ち絵がほしい',
        description: 'シューティングゲームに使う立ち絵が欲しいです。ゲームの詳細はhttps://example.comです。',
        user_id: 1
    },
    {
        title: '履修管理システムのプログラマを募集しています',
        description: '履修を管理するサービスを開発します。¥n場所：筑波大学中央図書館¥n日時：８月の３，４，５，６，９ 12:00~21:00',
        user_id: 1
    }
    ])
assigns = Assign.create([
    {
        job_id: 0,
        user_id: 2,
        status: 'yes'
    },
    {
        job_id: 1,
        user_id: 4,
        status: 'yes'
    },
    {
        job_id: 1,
        user_id: 5,
        status: 'yes'
    },
])