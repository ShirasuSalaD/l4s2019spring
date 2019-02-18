if Category.count == 0
  Category.create([
    {name: '書籍'},
    {name: '家電'},
    {name: 'ファッション'},
    {name: 'DVD/CD'},
    {name: '食品'},
    {name: 'その他'}
    ])
end