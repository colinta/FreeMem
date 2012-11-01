FreeMem
-------

This was written so I could get the free memory within a RubyMotion app, but it
works in any application.

If you're using Xcode, just copy FreeMem.h and FreeMem.m into your project.
This thing is WAY too tiny to justify building it as a framework or any such
nonsense.  *Please* don't ask me to, because I'll just be forced to say "but I
have this thing I have to do" and then look busy shuffling papers while I simply
ignore the request.  Then I'll feel bad, and might end up actually turning it
into a framework, but when other people see that they'll say "why'd you bother"
and they'll laugh at point at this tiny framework that only exposes one function
and I'll feel like a jerk.

Installation for RubyMotion
------------

###### Terminal
    git clone git@github.com:colinta/FreeMem vendor/FreeMem

###### RakeFile
```ruby
Motion::Project::App.setup do |app|
  # ...
  app.vendor_project('vendor/FreeMem/', :static)
```

###### Application
```ruby
NSLog("free: #{FreeMem.freeMemory}")
```
