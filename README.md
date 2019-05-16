# RRandom

Do you want to generate some random data? You've come to the right place.

This is an alternative to the faker gem which is:

1. Simpler. Way smaller API surface, looking at the faker API docs gives me
   choice anxiety.
2. Consistent. Want to generate names and email addresses that match for the
   same person? Yeah, me too.
3. Small. Doesn't load anything into memory unless you're actually using it.
   Really simple code base.
4. Unfinished. I just started building this thing to fit a specific use case
   where I needed it, it's not finished. There are way more things it could
   generate than are currently provided. I might add those later, I might not.
   Use this if you find it useful.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rrandom'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rrandom

## Usage

``` ruby
random = RRandom.new
random.first_name
random.last_name
random.name
random.email
random.gender
```

## A note on gender

This gem currently returns a binary male/female value for the gender option. I
personally do not believe that gender is binary and I acknowledge, accept and
respect those who identify as a different gender than the traditional
male/female distinction. The reason to stick to the "traditional" binary
distinction for now is for simplicity and maximum interoperability with legacy
systems. In the future I would like to implement a more comprehensive system
for dealing with gender, however I myself am not sure on what the best and most
respectful way of achieving this is, so I'd definitely appreciate any help on
this front. If you have any input on this front, please open an issue.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jnicklas/rrandom
