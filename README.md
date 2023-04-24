# Rxer::Api

    It is not in my mind to ask questions that cannot be answered.
    That is the soul standing upon the crossroad of vacillation.
    You search for wisdom, but achieve only a stasis of will.

This is a simple client for REST API of [Reindexer](https://github.com/Restream/reindexer/)

REST API fully described [here](https://editor.swagger.io/?url=https://raw.githubusercontent.com/Restream/reindexer/master/cpp_src/server/contrib/server.yml)

## Installation

Add these line to your application's Gemfile:

```ruby
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
gem 'rxer-api', github: 'etspring/rxer-api'
```
And then execute:

    $ bundle install

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem specific_install https://github.com/etspring/rxer-api.git

## Usage

```ruby
require 'rxer/api'
# Initialize client
client = Rxer::Api::Client.new(url: 'http://localhost:9088/')

# Drop db
client.drop_db(db_name: 'my_test_db')

# Create db
client.create_db(db_name: 'my_test_db')

# Define namespace confiuration
ns_config = {
    "name": "my_test_namespace",
    "storage": {
        "enabled": false
    },
    "indexes": {
       "name": "id",
       "json_paths": [
         "id"
       ],
       "field_type": "string",
       "index_type": "hash"
       ...
    }
}
# Create NS with defined config
client.create_namespace(db_name: 'my_test_db', namespace: ns_config)

# Truncate NS
client.truncate_namespace(db_name: 'my_test_db', namespace: 'my_test_namespace')

# Drop NS
client.drop_namespace(db_name: 'my_test_db', namespace: 'my_test_namespace')

# Insert items
items = [{id: "100", title: "Remember"}, {id: "101", title: "Cadia"}].map(&:to_json).join("\n")
client.create_items(db_name: 'my_test_db', ns_name: 'my_test_namespace', payload: items)

# Get items
q = { filter: "id = 'my_id_1' OR id = 'my_id_2'", format: 'json' }
client.get_items(db_name: 'my_test_db', ns_name: 'my_test_namespace', payload: q)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/etspring/rxer-api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

