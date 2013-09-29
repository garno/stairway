# Stairway
Easy and intuitive step by step processing of your business logic.

---

## Installation

Add this line to your application's Gemfile:

```
gem 'stairway'
```

## Usage

First, create a new *initializer* to define the different steps of your Stairway:

```
# config/initializers/stairways.rb

import = Stairway.new(:import)
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
Stairway.mount(:import).run(options)
```

## Define your steps

In the above section, you can see a `DownloadContent` class being intanciated. All your step should at least, respond to the `run` method. This method will be automatically called.

```
class DownloadContent

	def run(context, options)
		…do stuff here…		
	end

end
```

## Break the flow

At any time, if you want to stop the processing for whatever reason, you can do this:

```
class DownloadContent

  def run(context, options)
    begin
      …download your content…
    rescue DownloadError	
      Stairway.stop
    end
  end

end
```

## Run a single step

Sometime, I guess, you'll want to run a single step.

```
Stairway.mount(:import).run_step(:download, context, options)
```