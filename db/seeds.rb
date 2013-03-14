# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |i|
  BlogPost.create(title: "blogpost_#{i}", body: "<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id urna vitae augue commodo consequat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc ac est arcu, quis tincidunt diam. Praesent et mauris sit amet metus feugiat molestie sit amet vitae mauris. Ut sed auctor lacus. Aenean vitae nisl sollicitudin tellus porttitor suscipit nec ut lorem. Maecenas vitae nunc non urna dapibus tempus ut at est. Donec turpis felis, tempus nec consectetur ac, congue sit amet erat. Cras quis laoreet sapien.
</p>
<p>
Curabitur tempus elit id justo varius iaculis. Suspendisse lacus augue, rhoncus quis feugiat a, aliquam in diam. Vivamus viverra auctor nisl ac consectetur. Suspendisse et purus libero. Suspendisse quam elit, eleifend vitae malesuada at, rutrum vitae urna. Aenean risus ante, condimentum ut semper quis, sollicitudin nec odio. Fusce sodales bibendum urna quis placerat. Nam dapibus egestas erat vitae blandit. Vestibulum nec scelerisque nibh. Sed felis quam, adipiscing non cursus et, aliquam et diam. Nullam porttitor orci nec nulla interdum congue. Nunc congue imperdiet scelerisque. Duis eu massa sed odio rhoncus dignissim in ac orci. Pellentesque purus velit, mollis id malesuada rutrum, viverra scelerisque leo.
</p>")
end

5.times do |i|
  Page.create(title: "page_#{i}", body: "<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id urna vitae augue commodo consequat. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc ac est arcu, quis tincidunt diam. Praesent et mauris sit amet metus feugiat molestie sit amet vitae mauris. Ut sed auctor lacus. Aenean vitae nisl sollicitudin tellus porttitor suscipit nec ut lorem. Maecenas vitae nunc non urna dapibus tempus ut at est. Donec turpis felis, tempus nec consectetur ac, congue sit amet erat. Cras quis laoreet sapien.
</p>
<p>
Curabitur tempus elit id justo varius iaculis. Suspendisse lacus augue, rhoncus quis feugiat a, aliquam in diam. Vivamus viverra auctor nisl ac consectetur. Suspendisse et purus libero. Suspendisse quam elit, eleifend vitae malesuada at, rutrum vitae urna. Aenean risus ante, condimentum ut semper quis, sollicitudin nec odio. Fusce sodales bibendum urna quis placerat. Nam dapibus egestas erat vitae blandit. Vestibulum nec scelerisque nibh. Sed felis quam, adipiscing non cursus et, aliquam et diam. Nullam porttitor orci nec nulla interdum congue. Nunc congue imperdiet scelerisque. Duis eu massa sed odio rhoncus dignissim in ac orci. Pellentesque purus velit, mollis id malesuada rutrum, viverra scelerisque leo.
</p>")
end

Page.all.to_a.each do |page|
  Menu.create(content: page)
end

BlogPost.all.to_a.each do |blogpost|
  Menu.create(content: blogpost)
end