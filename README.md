# git-blog
Turn git commit message into blog article.

## They say programmers love DRY
There are tons of books yelling about how you shouldn't repeat yourself, how you should keep it DRY(Don't Repeat Yourself). Well, we tried hard to keep the code clean, but when it comes to blog we wrote, we seems quite ignorante to the DRY principle. 

During the whole developement process, there will always be some interesting points you want to record, so git gurus told us to write proper git commit messages for further reference or so. And yes, I followed, and I spent quite a time writing about the problem I encountered, how I found the solution, and what should might be useful in the future. That's nice, right?

But I've also got a blog to write! Wait, I don't want to REPEAT MYSELF. And that leads to a barely touch [blog site](http://blog.voidmain.me). And I want to change this.

## How this works
`git-blog` is a simple to use command line tool, which leverage the familiar `git commit` command. Basically, during the commit process, `git-blog` inserts two git hooks, namely `prepare-commit-msg` and `commit-msg`. The `prepare-commit-msg` provides you a self-defined blog template you can use, and the `commit-msg` does the heavy-lifting by turn the commit message into a real blog article. Quite simple and straightforward.

## Spec
- Basic git hooks for message preparation and commit message interception ★
- Support local file system (for jekyll) ★
- Support Github issue reference ★
- User authentication for Github ★
- Support wordpress and other blog services (if they provide API) ★★
- User authentication for the above blog services (if they provide API) ★★
- Support other code hosting services like Bitbucket or Gitcafe ★★
- Maybe a website for template sharing or blog service integration ★★★