# PetPatron

[![Website](https://img.shields.io/website?url=https%3A%2F%2Fwww.petpatron.help)](https://www.petpatron.help/)
[![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-5.2.3-red)](https://rubyonrails.org/)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Stimulus](https://img.shields.io/badge/Stimulus-1.1.1-blue)](https://stimulus.hotwired.dev/)
[![Mapbox](https://img.shields.io/badge/Mapbox-GL_JS-brightgreen)](https://www.mapbox.com/)

**PetPatron** is a web application designed to connect animal lovers with local shelters. 

- **Live Application**: [https://www.petpatron.help/](https://www.petpatron.help/)
- **GitHub Repository**: [https://github.com/GGC0des/petpatron](https://github.com/GGC0des/petpatron)

---

## Overview

**PetPatron** is a platform designed to facilitate connections between animal welfare organizations and individuals interested in supporting their causes. It provides a structured way to assist shelters through donations, volunteering, and adoption.  

- **Urgent Support / Emergencies** – A dedicated page for critical fundraisers and immediate calls for assistance, such as requests for essential supplies or emergency medical funding.  
- **Animal Search & Volunteering** – A searchable directory of shelter animals, filtered by postal code, allowing users to explore volunteering opportunities. Available caretaking options include fostering, dog walking, grooming, playtime, and adoption. 
- **Shelter Listings & Profiles** – A comprehensive listing of registered shelters, featuring their contact details, open hours, ongoing fundraisers, and available animals.  


---
## Features

- **Mobile-Responsive Design** – Optimized for seamless browsing on desktop, tablet, and mobile devices. (Update Release 2025 - Added responsive design). 
- **Smooth Animations & Interactive UI** – Enhances user experience with modern UI effects and transitions.
- **Advanced Search Functionality**: Multi-criteria search, including tag-based filtering, to quickly find animals or shelters matching specific preferences.
- **Interactive Map Integration**: Utilizes Mapbox to display local shelters, allowing users to locate and connect with nearby facilities.
- **Account Creation & Customized Interfaces** - enhancing user experience for different user roles.
- **Volunteer Booking System** – Personal accounts allow individuals to schedule volunteering actions, with shelters able to confirm or reschedule time slots.
- **Fundraising ** - Note that PetPatron is a **demo project**. While it includes donation simulation features, it is not integrated with Stripe or any other payment processing service.


## **User Roles & Interfaces**

- **Personal Accounts** – Individuals seeking to participate in volunteering or donations can create an account. This enables shelters to confirm or reschedule booked time slots.  
- **Personal Dashboard** - Individuals supporting animals can manage their personal information, profile picture, manage volunteer booking, manage their donations to fundraisers.
 
- **Shelter Accounts** – Any shelter can register and create an administrative account to manage shelter information, confirm or reschedule volunteer bookings, list adoptable animals, and post urgent fundraising campaigns.
- **Shelter Admin Dashboard** – Shelters can manage their information, approve or reschedule volunteer bookings, list animals, and create urgent fundraising campaigns.  

---
## **Technologies Used**  

- **Backend**:
  - [Ruby on Rails 5.2.3](https://rubyonrails.org/): Provides the core framework for application development.
- **Frontend**:
  - [JavaScript (ES6)](https://developer.mozilla.org/en-US/docs/Web/JavaScript): Enhances interactivity and user engagement.
  - [Stimulus 1.1.1](https://stimulus.hotwired.dev/): Manages JavaScript behavior in a structured manner.
- **Mapping**:
  - [Mapbox GL JS](https://www.mapbox.com/): Integrates interactive maps for geolocation features.
- **Database**:
  - [PostgreSQL](https://www.postgresql.org/): Manages relational data efficiently.
- **Styling**:
  - [SCSS](https://sass-lang.com/): Facilitates modular and maintainable CSS.
- **Authentication**:
  - [Devise](https://github.com/heartcombo/devise): For user and shelter account management.  

---

## Installation and Setup

To run PetPatron locally:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/GGC0des/petpatron.git
   cd petpatron
   ```
   
2. **Install dependencies:**
   ```bash
   bundle install
   yarn install
   ```
  
3. **Set up the database:**
  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```

4. **Start the server:**
   ```bash
   rails s
   ```
   Access the application at http://localhost:3000.








