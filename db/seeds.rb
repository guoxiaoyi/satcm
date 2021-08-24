# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
news = ArticleCategory.create({name: '新闻'})
ArticleCategory.create([{name: '新闻1', parent_id: news.id}, {name: '新闻2', parent_id: news.id},{name: '新闻3', parent_id: news.id}])

group = ArticleCategory.create({name: '组织架构'})
ArticleCategory.create([{name: '组织架构1', parent_id: group.id}, {name: '组织架构2', parent_id: group.id},{name: '组织架构3', parent_id: group.id}])

ArticleCategory.create([{name: '党群建设'}, {name: '政策研究'},{name: '通知公告'},{name: '信息化'},{name: '综合统计'}])

