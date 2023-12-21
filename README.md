# My Rails
Rails sandbox


```
RUBY_DEBUG_OPEN=true rails server
```

## App
Started with the Rails [Getting Started](https://guides.rubyonrails.org/getting_started.html#creating-the-blog-application) Blog Application.

```
rails new .
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

## References

- https://guides.rubyonrails.org/getting_started.html - Getting Started App
- https://github.com/ruby/vscode-rdbg - VSCode Ruby rdbg Debugger