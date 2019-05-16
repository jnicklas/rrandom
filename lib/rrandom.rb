# frozen_string_literal: true
require "rrandom/version"

class RRandom
  class Loader
    def initialize
      @mutex = Mutex.new
    end

    def get(name)
      ivar_name = :"@_list_#{name}"

      return instance_variable_get(ivar_name) if instance_variable_get(ivar_name)

      @mutex.synchronize do
        # do it again, in case of race condition
        return instance_variable_get(ivar_name) if instance_variable_get(ivar_name)

        list = load_list(name)
        instance_variable_set(ivar_name, list)
        list
      end
    end

    def load_list(name)
      File.read(File.expand_path("rrandom/source/#{name}.txt", __dir__)).chomp.lines
    end
  end

  class Error < StandardError; end

  class << self
    attr_accessor :loader
  end

  def initialize(random_domain: false)
    @use_random_domain = random_domain
  end

  def use_random_domain?
    @use_random_domain
  end

  def gender
    @gender ||= ["male", "female"].sample
  end

  def first_name
    @first_name ||= case gender
      when "male" then RRandom.loader.get(:male_first_names).sample.chomp
      when "female" then RRandom.loader.get(:female_first_names).sample.chomp
    end
  end

  def last_name
    @last_name ||= RRandom.loader.get(:last_names).sample.chomp
  end

  def name
    "#{first_name} #{last_name}"
  end

  def email
    "#{first_name.downcase}.#{last_name.downcase}@#{domain}"
  end

  def domain
    "example.com"
  end
end

RRandom.loader = RRandom::Loader.new
