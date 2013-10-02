# Stairway
Easy and intuitive step by step processing of your business logic.

## Installation

Add this line to your application's Gemfile:

```
gem 'stairway'
```

## Usage

First, create a new *initializer* to define the different steps of your Stairway:

```
# config/initializers/stairways.rb

import = Stairway::Stairs.new(:import)
import.steps = {
  download:    ImportSchedule::Download.new,
  unzip:       ImportSchedule::Unzip.new,
  convert_sql: ImportSchedule::ConvertToSQL.new,
  import:      ImportSchedule::Import.new
  clean:       ImportSchedule::Cleanup.new
}

Stairway.register(import)
```

Now, you can run the logic from anywhere in your application using:

```
Stairway.mount(:import).run
```

## Define your steps

In the above section, you can see a `ImportSchedule::Download` class being intanciated. All your step should at least, respond to the `run` method. This method will be automatically called.

```
module ImportSchedule
  class Download < Stairway::Step
    def run
      …do stuff here…		

      context[:file_path] = '/tmp/boom.zip'

      # `context` is available in all the steps
      # and can be modified.
    end
  emd
end
```

## Break the flow

At any time, if you want to stop the processing for whatever reason, you can do this:

```
module ImportSchedule
  class Download < Stairway::Step
    def run
      begin
        …download your content…
      rescue DownloadError	
        Stairway.stop
      end
    end
  end
end
```

## Run a single step

Sometime, I guess, you'll want to run a single step.

```
Stairway.mount(:import).run_step(:download, context, options)
```

## License

Stairway is © 2013-2014 [Samuel Garneau](http://twitter.com/garno) and may be freely distributed under the [MIT license](https://github.com/garno/stairway/blob/master/LICENSE). See the `LICENSE` file.
