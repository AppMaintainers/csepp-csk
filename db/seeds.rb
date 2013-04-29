Page.destroy_all
BlogPost.destroy_all
Menu.destroy_all
User.destroy_all

user = User.new(email: 'csepp@csepp.hu', password: '12345678', password_confirmation: '12345678')
user.skip_confirmation!
user.save!

sample_text = <<eos
<p>
Curabitur tempus elit id justo varius iaculis. Suspendisse lacus augue, rhoncus quis feugiat a, aliquam in diam. Vivamus viverra auctor nisl ac consectetur. Suspendisse et purus libero. Suspendisse quam elit, eleifend vitae malesuada at, rutrum vitae urna. Aenean risus ante, condimentum ut semper quis, sollicitudin nec odio. Fusce sodales bibendum urna quis placerat. Nam dapibus egestas erat vitae blandit. Vestibulum nec scelerisque nibh. Sed felis quam, adipiscing non cursus et, aliquam et diam. Nullam porttitor orci nec nulla interdum congue. Nunc congue imperdiet scelerisque. Duis eu massa sed odio rhoncus dignissim in ac orci. Pellentesque purus velit, mollis id malesuada rutrum, viverra scelerisque leo.
</p>
eos

sample_images = %w"image_1.jpg image_2.jpg"

15.times do |num|
  blog_post = BlogPost.create(
      title: "Blog Post #{ num }",
      body: sample_text * rand( 1..3 )
  )

  ( sample_images * 4 ).shuffle.each do |image|
    blog_post.attached_pictures.create(
        picture: File.open( Rails.root.join('db',image) )
    )
    blog_post.attached_documents.create(
        document: File.open( Rails.root.join('db',image) )
    )
  end
end

5.times do |num|
  page = Page.create(
      title: "Page #{ num }",
      body: sample_text * rand( 1..3 )
  )

  ( sample_images * 10 ).shuffle.each do |image|
    page.attached_pictures.create(
        picture: File.open( Rails.root.join('db',image) )
    )
  end
  ( sample_images * 2 ).shuffle.each do |image|
    page.attached_documents.create(
        document: File.open( Rails.root.join('db',image) )
    )
  end
end

Page.all.to_a.each do |page|
  Menu.create( content: page )
end

BlogPost.all.to_a.each do |blog_post|
  Menu.create( content: blog_post )
end