# Create sample blog posts
puts "Creating sample blog posts..."

posts_data = [
  {
    title: "Welcome to My Blog!",
    body: "This is my very first blog post! I'm excited to share my thoughts and experiences with you. 

This blog will cover various topics including web development, technology trends, and personal experiences. I hope you'll find the content interesting and engaging.

Stay tuned for more posts coming soon!"
  },
  {
    title: "Getting Started with Ruby on Rails",
    body: "Ruby on Rails is an amazing web development framework that makes building web applications both fun and productive.

In this post, I'll share some tips for beginners:

1. Start with the Rails Tutorial by Michael Hartl
2. Practice building small applications
3. Join the Rails community - they're very welcoming!
4. Don't be afraid to read the documentation
5. Learn by doing, not just by reading

Rails follows the principle of 'Convention over Configuration' which means less setup and more coding. The framework provides sensible defaults that work for most applications.

Happy coding!"
  },
  {
    title: "The Power of Version Control with Git",
    body: "Version control is essential for any developer, whether you're working solo or on a team. Git has become the standard tool for version control, and for good reason.

Here are some key benefits of using Git:

- Track changes to your code over time
- Collaborate with other developers seamlessly  
- Create branches for experimental features
- Easily revert changes when something goes wrong
- Maintain a complete history of your project

Some essential Git commands every developer should know:
- git init (initialize a repository)
- git add (stage changes)
- git commit (save changes)
- git push (upload to remote repository)
- git pull (download from remote repository)

Don't forget to write meaningful commit messages - your future self will thank you!"
  },
  {
    title: "Building Responsive Web Applications",
    body: "In today's mobile-first world, building responsive web applications is no longer optional - it's essential. Users expect websites to work seamlessly across all devices.

Key principles for responsive design:

1. **Mobile-First Approach**: Start designing for mobile devices, then enhance for larger screens
2. **Flexible Grid Systems**: Use CSS Grid or Flexbox for layouts that adapt to different screen sizes  
3. **Responsive Images**: Ensure images scale properly and don't break on smaller screens
4. **Touch-Friendly Interface**: Make buttons and links large enough for finger navigation

CSS frameworks like Bootstrap or Tailwind CSS can help speed up the development process while ensuring responsiveness. However, understanding the underlying CSS concepts is crucial for creating truly custom responsive designs.

Testing across multiple devices and screen sizes is essential. Use browser developer tools to simulate different devices during development."
  }
]

posts_data.each do |post_attrs|
  post = Post.find_or_create_by(title: post_attrs[:title]) do |p|
    p.body = post_attrs[:body]
    p.created_at = rand(30.days).seconds.ago
  end
  puts "Created post: #{post.title}"
end

puts "Seed data created successfully!"
puts "Total posts: #{Post.count}"
