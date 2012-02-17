# Associator
Associate any model to any model.

# Description
Creates a one-to-many relationship between any models.

#Installation
1 Add to your application Gemfile

```ruby
  gem 'associator'
```

2 Type

```shell
  bundle install
  rake associator_engine:install:migrations
  rake db:migrate
```

#Usage
##In your rails app model
###Add to your model

```ruby
  associated :with => :THE_OTHER_MODEL_NAME
```

or

```ruby
  associated :with => :RELATION_NAME, :class_name => 'THE_OTHER_MODEL_CLASS_NAME'
```

###Add relation
```ruby
  foo = Foo.first
  bar = Bar.first
  foo.add_associated bar
```

###Remove relation
```ruby
  foo = Foo.first
  bar = Bar.first
  foo.del_associated bar
```
