# My Rails
Rails sandbox


```
RUBY_DEBUG_OPEN=true rails server
```

Running after cloning:
```
install bundle --force
```
Setup database:
```
bundle exec rake db:create db:migrate
```

## App
Started with the Rails [Getting Started](https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application) Blog Application.

```
rails new .
```

To *not* generate tests use:
```
rails new . -T
```

## Setup

### Debugger

#### Running

```
RUBY_DEBUG_OPEN=true rails server
```

#### Configuration

Already included in the Getting Started `Blog application`:
```
gem install debug
```

Create `.vscode/launch.json`:
```
{
   "version": "0.2.0",
   "configurations": [
      {
        "type": "rdbg",
        "name": "Attach with rdbg",
        "request": "attach"
      }
   ]
}
```

### Static Page
Using generator:

```
rails generate controller StaticPages home
```
The following files are created:

```
create  app/controllers/static_pages_controller.rb
route  get 'static_pages/home'
invoke  erb
create    app/views/static_pages
create    app/views/static_pages/home.html.erb
invoke  test_unit
create    test/controllers/static_pages_controller_test.rb
invoke  helper
create    app/helpers/static_pages_helper.rb
invoke    test_unit
```

Update `config\routes.rb`:
```
 get 'static_pages/home'
 ..
 root "static_pages#home"
```
Next, make updates to `app/views/static_pages/home.html.erb`.

### Cells
Updated the article list view (index) to use a [cell](https://github.com/trailblazer/cells).

- `app/cells/article_cell.rb`
- `app/cells/article/index.erb`
- `app/views/articles/index.html.erb`
  ```
  <%= cell('article').(:index) %>
  ```

### Codespaces
There are some specific to work in Codespaces.

Requires to install rails:
```
gem install rails
```

In the controllers required to add the following before a **POST** (Create):
```
skip_before_action :verify_authenticity_token
```
Otherwise will not write to the database. Refer to [stackoverflow question](https://stackoverflow.com/questions/65688157/why-is-my-http-origin-header-not-matching-request-base-url-and-how-to-fix) for more details.

## Test

### RSpec

```
bundle exec rspec
```

Add [RSpec](https://rspec.info/features/6-0/rspec-rails/) template code:
- Add `gem "rspec-rails"`
- Install
    ```
    rails g rspec:install
    ```

### RSpec-cells
Specs are placed in the `spec/cells` directory. Can also generate an example:

```
rails g rspec:cell articles show
```

Reference [here](https://github.com/trailblazer/rspec-cells).

### Factory_bot_rails
Reference [here](https://github.com/thoughtbot/factory_bot_rails)

Using the generator:

```
rails g factory_bot:model Article title:string body:text
```

### Mocking
Reference [here](https://github.com/freerange/mocha).

To config with *RSpec* updated `spec/spec_helper.rb`:

- remove the `config.mock_with :rspec do |mocks|` section
- add `config.mock_with :mocha`

## References

- https://guides.rubyonrails.org/getting_started.html - Getting Started App
- https://github.com/ruby/vscode-rdbg - VSCode Ruby rdbg Debugger