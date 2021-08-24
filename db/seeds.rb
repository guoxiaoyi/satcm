# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
news = ArticleCategory.create({name: '新闻', custom_key: '新闻'})
group = ArticleCategory.create({name: '组织架构'})
office_build = ArticleCategory.create({name: "科室建设", custom_key: '科室建设'})

ArticleCategory.create([])
ArticleCategory.create([
  {name: '党群建设'}, 
  {name: '政策研究'},
  {name: '通知公告'}, 
  {name: '信息化'},
  {name: '综合统计'},
  {name: '学术研究'},
  {name: '信息发布'},
  {name: '组织架构1', parent_id: group.id}, 
  {name: '组织架构2', parent_id: group.id},
  {name: '组织架构3', parent_id: group.id},
  {name: '新闻1', parent_id: news.id}, 
  {name: '新闻2', parent_id: news.id},
  {name: '新闻3', parent_id: news.id},
  {parent_id: office_build.id, custom_key: '战略规划处', name: '战略规划处'},
  {parent_id: office_build.id, custom_key: '政策研究处', name: '政策研究处'},
  {parent_id: office_build.id, custom_key: '项目监管处', name: '项目监管处'},
  {parent_id: office_build.id, custom_key: '综合统计处', name: '综合统计处'},
  {parent_id: office_build.id, custom_key: '医疗服务评价处', name: '医疗服务评价处'},
  {parent_id: office_build.id, custom_key: '信息化建设处', name: '信息化建设处'},
  {parent_id: office_build.id, custom_key: '健康医疗大数据处', name: '健康医疗大数据处'},
  {parent_id: office_build.id, custom_key: '专项调查处', name: '专项调查处'}
])


%w(战略规划处 政策研究处 项目监管处 综合统计处 医疗服务评价处 信息化建设处 健康医疗大数据处 专项调查处).each do |k|
  parent = ArticleCategory.find_by(custom_key: k)
  ArticleCategory.create([
    {parent_id: parent.id, name: '最新消息'},
    {parent_id: parent.id, name: '医改动态'},
    {parent_id: parent.id, name: '中医药规则'},
    {parent_id: parent.id, name: '专题专栏'},
    {parent_id: parent.id, name: '关于我们'},

  ])
end
