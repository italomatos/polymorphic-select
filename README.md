# Rails 7 Polymorphic Relationship with Global ID - README

## Overview

This is a simple Rails 7 project demonstrating the use of polymorphic relationships with Global ID for handling associations between three models: Person, Company, and Building. In this project, a Building can be associated with either a Person or a Company through polymorphism.

## Prerequisites

- Ruby 3
- Rails 7
- PostgreSQL (or any other supported database)

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/italomatos/polymorphic-select.git
   ```

2. Navigate to the project directory:

   ```bash
   cd polymorphic-select
   ```

3. Install dependencies:

   ```bash
   bundle install
   ```

4. Set up the database:

   ```bash
   rails db:create db:migrate
   ```

5. Run the server:

   ```bash
   rails server
   ```

   The application should now be running at `http://localhost:3000`.

## Usage

### 1. Creating Records

#### 1.1 Creating a Person:

   Navigate to `http://localhost:3000/people/new` and fill in the details to create a new person.

#### 1.2 Creating a Company:

   Navigate to `http://localhost:3000/companies/new` and provide the necessary information to create a new company.

#### 1.3 Creating a Building:

   Navigate to `http://localhost:3000/buildings/new` and choose either a person or a company to associate with the building.

### 2. Viewing Associations

   Navigate to the details page of a building at `http://localhost:3000/buildings/:id`, where `:id` is the ID of the building. Here, you can see the associated person or company.

### 3. Editing Associations

   To change the association of a building, navigate to `http://localhost:3000/buildings/:id/edit` and select a different person or company.

## Polymorphic Relationship Implementation

The key aspect of this project is the use of polymorphic relationships. This is achieved by defining the following associations in the models:

```ruby
# app/models/building.rb
class Building < ApplicationRecord
  belongs_to :onwer, polymorphic: true

  def onwer_sgid=(value)
    self.onwer = GlobalID::Locator.locate_signed(value)
  end
end

# app/models/person.rb
class Person < ApplicationRecord
  has_many :buildings, as: :owner
end

# app/models/company.rb
class Company < ApplicationRecord
  has_many :buildings, as: :owner
end
```

This allows a Building to be associated with either a Person or a Company through the `owner` association.

## Contributing

Feel free to contribute to this project by submitting issues or pull requests. Your feedback and contributions are highly appreciated!

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
