# Travel Management System - SQL

Welcome to the Travel Management System repository. This project is designed to manage various aspects of a travel business, including customer details, employee details, destinations, transportation options (trains, buses, flights, cruises, cars), payment, and booking details. It leverages SQL to efficiently store, retrieve, and manage data, and includes complex SQL queries such as subqueries and joins to extract meaningful information.

## Features 

- **Customer Management:** Store and manage customer information.
- **Employee Management:** Keep track of employee details and roles.
- **Destinations:** Manage information about various travel destinations.
- **Transportation:** Include details for trains, buses, flights, cruises, and car rentals.
- **Booking Management:** Handle bookings and reservations.
- **Payment Processing:** Manage payment details and history.
- **Advanced SQL Queries:** Utilize complex SQL queries, including subqueries and joins, to extract and manipulate data.

## Project Structure

- **Database Schema:** Defines the structure of the database with tables for customers, employees, destinations, transportation, bookings, and payments.
- **SQL Queries:** Collection of SQL scripts used for various operations like data insertion, retrieval, and complex queries.

## Schema 

1. **CustomerDestails:** `CustomerID` `FullName` `Email` `Phone` `Identity_proof`
   
3. **Employee:** `EmployeeID` `Emp_name` `Department` `Emp_salary` `Emp_Position`
   
5. **Destination:** `DestinationID` `DestinationName` `Distance` `Country`
6. **Trains:** `TrainID` `TrainName` `T_DepartureTime` `T_ArrivalTime` `T_Origin` `T_Destination` `DestinationID`
7. **Flights:** `FlightID` `FlightNumber` `Airline` `FL_DepartureTime` `FL_ArrivalTime` `FL_Origin` `FL_Destination` `DestinationID`
8. **Buses:** `BusID` `BusNumber` `Operator` `B_DepartureTime` `B_ArrivalTime` `B_Origin` `B_Destination` `DestinationID`
9. **Cruise:** `CruiseID` `CruiseName` `CR_DepartureTime` `CR_ArrivalTime` `CR_Origin` `CR_Destination` `DestinationID`
10. **Car:** `CarID` `CarModel` `PlateNumber` `Capacity` `C_Origin` `C_Destination` `DestinationID`
11. **Payment:** `PaymentID` `PaymentMethod` `PaymentAmount` `PaymentDate` `CustomerID`
12. **Booking:** `BookingID` `CustomerID` `Booking_status` `PaymentID` `Booking_time` `Transport` `Origin` `Destination`

## Usage

* **Customer Management**

   - Add new customers
   - Update customer information
   - Delete customer records
   - Retrieve customer details

* **Employee Management**

   - Add new employees
   - Update employee information
   - Delete employee records
   - Retrieve employee details

* **Manage Destinations**

   - Add new travel destinations
   - Update destination details
   - Delete destination records
   - Retrieve destination information

* **Transportation Options**

   - Manage trains, buses, flights, cruises, and car rental details

* **Booking and Payment Management**

   - Handle booking and reservation details
   - Process and manage payments
  
* **Advanced SQL Queries**

   - Use provided SQL scripts to execute complex queries involving subqueries and joins

## Authors 

This project is co-owned by: [@AmishiDesai04](https://www.github.com/AmishiDesai04) [@chahelgupta](https://www.github.com/chahelgupta) [@reneeka](https://www.github.com/reneeka)  

##

Please don't hesitate to offer suggestions, report any issues you encounter, share your feedback, or engage in any other form of communication! Your input is highly valued and appreciated.

