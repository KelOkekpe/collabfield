require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  it 'by_category scope gets posts by particular category' do
   category = create(:category)
   create(:post, category_id: category.id)
   create_list(:post, 10)
   posts = Post.by_category(category.branch, category.name)
   expect(posts.count).to eq 1
   expect(posts[0].category.name).to eq category.name
 end

 it 'by_branch scope gets posts by particular branch' do
   category = create(:category)
   create(:post, category_id: category.id)
   create_list(:post, 10)
   posts = Post.by_branch(category.branch)
   expect(posts.count).to eq 1
   expect(posts[0].category.branch).to eq category.branch
 end

 it 'search finds a matching post' do
   post = create(:post, title: 'awesome title', content: 'great content ' * 5)
   create_list(:post, 10, title: ('a'..'c' * 2).to_a.shuffle.join)
   expect(Post.search('awesome').count).to eq 1
   expect(Post.search('awesome')[0].id).to eq post.id
   expect(Post.search('great').count).to eq 1
   expect(Post.search('great')[0].id).to eq post.id
 end


end
