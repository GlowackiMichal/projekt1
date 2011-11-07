commentable = Post.create
commentable.comments.create(:title => "First comment.", :comment => "This is the first comment.")

commentable = Post.find(1)
comments = commentable.comments.recent.limit(10).all 