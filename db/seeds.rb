
puts '🌱 Seeding messages...'
pp 'Deleting old data...'
User.destroy_all
Blog.destroy_all
Comment.destroy_all

pp 'Creating users...'

user1 = User.create(username: 'john doe', email: 'john@example.com', password: 'john2030')

user2 = User.create(username: 'jane doe', email: 'jane@example.com', password: 'jane2030')
user3 = User.create(username: 'admin', email: 'admin@example.com', password: 'admin2030')

pp 'Creating blogs....'

blog1 = Blog.create_blog(
  title: 'Next Js is Here to Stay',
  image: 'https://nextjs.org/static/blog/next-13-4/twitter-card.png',
  body: "
    <p>Next.js has gained tremendous popularity in the web development community, and for good reason. With its built-in server-side rendering capabilities, excellent performance, and a smooth development experience, Next.js has become the go-to framework for many developers building modern web applications.</p><p>One of the key features that make <b>Next.js</b> stand out is its ability to handle server-side rendering (SSR) out of the box. This not only improves SEO and initial load times but also provides a more seamless user experience.</p><p>Additionally, Next.js comes with powerful routing capabilities and supports various data-fetching methods, making it easy to integrate with APIs and backend services</p>.<p> As more and more companies adopt Next.js for their projects, it becomes clear that this framework is here to stay. Its active community and continuous development ensure that it will remain relevant and up-to-date with the latest web development trends.</p>",
  user_id: user1.id
)
blog2 = Blog.create_blog(
  title: 'My First Day Learning React',
  image: 'https://t4.ftcdn.net/jpg/02/97/26/79/360_F_297267951_j4riVSaWgIj3kVVfBwkacXTBfako9Gkj.jpg',
  body: "<p>Today was an exciting day as I embarked on my journey to learn React, one of the most popular JavaScript libraries for building user interfaces. Having some experience with HTML, CSS, and JavaScript, I was eager to dive into the world of React and see what it had to offer.</p>
    <p>The first thing that caught my attention was React's component-based architecture. Breaking down the UI into reusable components made the code much more organized and easier to manage. It felt empowering to create modular pieces that could be combined to build complex applications.</p>
    <p>As I delved deeper into React, I learned about state and props, which allow components to maintain and share data efficiently. Managing state changes using React's built-in methods was a revelation, and I could see how it simplified the entire development process.</p>
    <p>By the end of the day, I had built a simple yet functional React application. While there were some challenges, the feeling of accomplishment was incredible. I am now looking forward to exploring more advanced topics in React and continuing this exciting learning journey.</p>",
  user_id: user1.id
)
blog3 = Blog.create_blog(
  title: 'Is PHP dead?',
  image: 'https://www.temok.com/blog/wp-content/uploads/2022/01/Is-PHP-Dead-or-Still-have-a-Future-in-Web-Development.jpg',
  body: "<p>The debate surrounding the future of PHP has been ongoing for quite some time. Some critics claim that PHP is a dying language, while others argue that it remains a robust and widely used technology.</p>
  <p>It's essential to consider the context in which PHP is used. While it may have lost some ground to newer languages and frameworks in recent years, PHP continues to power a substantial portion of the web. Many popular content management systems (CMS) like WordPress and Drupal rely heavily on PHP, ensuring its relevance in the web development ecosystem.</p>
  <p>Moreover, PHP has undergone significant improvements over the years. The latest versions have introduced performance optimizations and modern features, making it a more competitive choice for web development.</p>
  <p>Ultimately, the fate of PHP depends on the evolving web development landscape and the community's support. While other languages gain traction, PHP's longevity is undeniable, and it continues to thrive in various applications. </p><p>So, rather than being dead, PHP is adapting and evolving to meet the demands of modern web development.</p>",
  user_id: user1.id
)
blog4 = Blog.create_blog(
  title: 'My first year of programming',
  image: 'https://www.freecodecamp.org/news/content/images/2022/12/main-image.png',
  body: "<p>Tags: coding journey, web development, JavaScript, HTML, CSS, React, Express, MySQL, PHP, OOP, software engineering</p>
  <p>Already, it's been already a year and a half I had my first coding experience and... what a journey. Even it's only a small step, it's feeling like being already miles away from my starting point and this is what I've done during this time.</p>
  <p>First Week:<br>Everything's been interesting so far, from learning to use loops, to conditions, my first bug encounter, first commits, he really seems I'm in love with my first coding week, I'm doing JS, HTML, CSS, I type code and I see stuff in my browser it's awesome.</p>
  <p>First Month:<br>My first team project is done, a really simple website, with just plain HTML, CSS and JS, nothing fancy but still, how pleased I am to have achieved something like that in just a month with my teammates, at that time I feared using too many branches, I named them randomly using who's been working on the branch and stuff, it was a real mess.</p>
  <p>First quarter:<br>I've been doing React all day, everyday, learning how components work, how to handle states, what are API, how to work with them, I did my first web app, a simple superhero game using a third-party API, not bad.</p>
  <p>First semester:<br>I've done my first full-stack application using React, Express, and mySQL, learned a new language for my first internship PHP, learning a new language has been both easier than I first thought and allowed me to learn new ways to code, new ways to think about my program, here come's the OOP and my first clean code readings.</p>
  <p>First year:<br>I've graduated from my boot camp, finished my first internship with really good feedback from my manager, found out that maybe our fundamentals while boot camp graduates were a bit light and so I've studied OOP, data structures, algorithms, I've been doing a lot of exercises to practice and fill the gap in my computer science knowledge.</p>
  <p>Today:<br>And here I am, I work now as a graduate software engineer for a startup, I learned a lot about clean code, software craftsmanship, software architecture, I still try to improve as much as possible my fundamentals whether it's algorithms, core software engineer, or subjects like Domain Driven Design or clean architecture, I now understand that what makes a developer is not the language he uses, but his fundamentals, his thinking, that's why I now want to work as much as possible on my core programming skill, that will be of use for my whole career.</p>
  <p>What in the future:<br>I really think that investing in the right set of skills today could make a huge difference in your career, learning skills that apply to every programming language are really my main focus today, I also think that skills like DevOps, system design would be very well worth the investment.</p>
  <p>Final words:<br>If like me, you always wanted to work as a programmer, but just kind of lost your tracks, don't lose hope, it's just absolutely impressing to step back and see what we can achieve in just a single year, with a good mix of passion and hard work, and don't forget, we are not in a sprint, we are here for the long run.</p>",
  user_id: user2.id
)
blog5 = Blog.create_blog(
  title: 'Deploying to Vercel',
  image: 'https://mms.businesswire.com/media/20210216006039/en/859393/23/vercel.jpg',
  body: "<ul>
  <li>Vercel Deployment: A successful build results in files compatible with Vercel platform features.</li>
  <li>Four ways to deploy projects to Vercel:
    <ul>
      <li>Git: Common method using Git repositories for automatic deployments.</li>
      <li>Vercel CLI: Allows deployment from the Command Line Interface, whether connected to Git or not.</li>
      <li>Deploy Hooks: Useful for triggering deployments based on external events without touching code.</li>
      <li>Vercel REST API: Used for creating deployments via HTTP POST request with custom workflows.</li>
    </ul>
  </li>
  <li>Deployment Summary: After deploying, Vercel generates outputs like Edge Middleware, Static Assets, Functions, and ISR Functions.</li>
</ul>
<p>A Vercel Deployment results from a successful build of your Project. The build emits files that are compatible with the Build Output API, a file-system-based specification for a directory structure that utilizes all of the Vercel platform features, such as Serverless Functions, Edge Functions, routing, and caching.</p>
<p>When you create a deployment, Vercel automatically adds a new and unique Generated URL. You can visit this URL to preview your changes in a live environment.</p>
<p>You can deploy your projects to Vercel in four different ways:</p>
<ul>
  <li>Git: The most common way to create a Deployment on Vercel is through pushing code to Git repositories.</li>
  <li>Vercel CLI: Allows you to deploy your Projects directly from the Command Line Interface (CLI).</li>
  <li>Deploy Hooks: Another way of creating deployments on Vercel, useful when changes depend on external events.</li>
  <li>Vercel REST API: Used to create Deployments by making an HTTP POST request to the relevant endpoint.</li>
</ul>
<p>Deployment Summary: When you deploy your website to Vercel, the platform generates multiple outputs as a result of your build. These outputs include Edge Middleware, Static Assets, Functions (Serverless Functions or Edge Functions), and ISR Functions. The deployment summary provides a detailed overview of all these outputs, organized by type.</p>",
  user_id: user2.id
)
blog6 = Blog.create_blog(
  title: 'My Challenges Deploying Sinatra App',
  image: 'https://i.imgur.com/ugnOU1Q.jpg',
  body: "<p>It is the last week of the fourth phase here at Moringa where we tackled ruby basics and how to create a custom rest Api using <b>Sinatra</b>. Sinatra is a lightweight application that receives minimal to no support from the dev community that favors rails over the enstraged sinatra</p>
  <p>This week, I built my blog web app Tech Tales, which allows students to blog and share their learning journey to inspire and help others grow. However, i found it almost impossible to host my sinatra backend Api to the available hosting platforms</p>
  <p>One of the challenges of hosting Sinatra api is limited hosting providers support.Sinatra, being a Ruby-based framework, requires support for Ruby and Rack applications. While many popular hosting providers like Heroku and AWS offer support for Ruby on Rails applications, finding one that provides dedicated support for Sinatra apps can be more challenging</p>
  <p>Another challenge that i encountered is that there are alot of challenges while configuring and structuring the application in a way that is acceptable by hosting providers. Providers such as <strong>Render</strong> have various set of rules, such as including a render.yaml file in the application, which are difficult to understand. Furthermore, Managing dependencies, handling gem installations, and configuring database connections can be more intricate in Sinatra apps</p>
  <p>In conclusion, while While hosting a Sinatra app can present some unique challenges, it's important to remember that with the right approach and tools, these hurdles can be overcome. Embrace the flexibility and elegance of Sinatra while considering the specific hosting requirements and using appropriate solutions to ensure your app runs seamlessly in production. With careful planning and attention to detail, hosting your Sinatra app can be a rewarding and successful experience.</p>
  <p>Let me know how you managed to resolve sinatra hosting errors by commenting below this post. Thanks for reading</p>",
  user_id: user2.id
)
pp 'Creating Comments....'
comment1 = Comment.create(
  blog_id: blog1.id,
  user_id: user2.id,
  body: 'Awesome post'
)
comment2 = Comment.create(
  blog_id: blog1.id,
  user_id: user1.id,
  body: 'expect more blogs from me guys'
)
comment3 = Comment.create(
  blog_id: blog1.id,
  user_id: user3.id,
  body: 'Interesting post'
)
comment4 = Comment.create(
  blog_id: blog2.id,
  user_id: user3.id,
  body: 'Looking forward to more content like this!'
)
comment5 = Comment.create(
  blog_id: blog2.id,
  user_id: user1.id,
  body: 'best post i have read in years'
)
comment6 = Comment.create(
  blog_id: blog3.id,
  user_id: user3.id,
  body: 'I like the way you write'
)
comment7 = Comment.create(
  blog_id: blog4.id,
  user_id: user1.id,
  body: 'you growth journey is inspiring'
)
comment8 = Comment.create(
  blog_id: blog5.id,
  user_id: user2.id,
  body: 'This is my first blog guys, let me know what you think'
)
comment9 = Comment.create(
  blog_id: blog6.id,
  user_id: user3.id,
  body: 'I have learned alot from this post, thanks'
)
comment10 = Comment.create(
  blog_id: blog5.id,
  user_id: user1.id,
  body: 'Interesting post, i will bookmark this'
)

puts '✅ Done seeding!'
