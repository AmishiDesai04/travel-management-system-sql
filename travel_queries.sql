UPDATE Employee SET Emp_Position = 'Driver' WHERE EmployeeID = 2;
SELECT * FROM Employee;

CREATE TABLE CustomerTravelDoc AS SELECT CustomerID, FullName, Identity_proof FROM CustomerDetails;
SELECT * FROM CustomerTravelDoc;

ALTER TABLE CustomerTravelDoc RENAME TO Customer_documents;
SELECT * FROM Customer_documents;
 
ALTER TABLE CustomerDetails
ADD CONSTRAINT CK_email_format CHECK (Email LIKE '%@gmail.com');

ALTER TABLE Booking
MODIFY COLUMN Booking_status VARCHAR(20) NOT NULL DEFAULT 'Pending';

-- INSERT INTO Payment (PaymentID, PaymentMethod, PaymentAmount, PaymentDate, CustomerID)
-- VALUES (111, 'Debit Card', 3000.00, NULL , 7)

INSERT INTO Booking (BookingID, CustomerID, PaymentID, Booking_time, Transport, Origin, Destination) VALUES (11, 7, 111, '2024-03-11 01:00:00', 'AI103', 'Delhi', 'Chennai');
SELECT * FROM Booking;

UPDATE Payment SET PaymentAmount = PaymentAmount * 1.1 WHERE CustomerID IN (1, 3, 5) AND PaymentMethod = 'Credit Card';
SELECT * FROM Payment;

SELECT * FROM Flights WHERE Airline LIKE 'A%A'

SET SQL_SAFE_UPDATES = 0;
UPDATE Destination SET Distance = 500 WHERE Distance = 0;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Destination WHERE Country = 'India' AND Distance BETWEEN 500 AND 1500;

SELECT DISTINCT Country FROM Destination;

DESC Booking;

-- self join
SELECT b1.BookingID AS BookingID1, b1.CustomerID AS CustomerID1, b1.Booking_status AS BookingStatus1, b2.BookingID AS BookingID2, b2.CustomerID AS CustomerID2, b2.Booking_status AS BookingStatus2 
FROM Booking b1, Booking b2 WHERE b1.Origin = b2.Destination;

SELECT DISTINCT d.DestinationName, t.TrainName AS Train, f.FlightNumber AS Flight, b.BusNumber AS Bus, c.CruiseName AS Cruise
FROM Destination d LEFT JOIN Trains t ON d.DestinationID = t.DestinationID
LEFT JOIN Flights f ON d.DestinationID = f.DestinationID
LEFT JOIN Buses b ON d.DestinationID = b.DestinationID
LEFT JOIN Cruise c ON d.DestinationID = c.DestinationID
WHERE d.DestinationName = 'Singapore';

-- SELECT 
    d.DestinationName,
    GROUP_CONCAT(DISTINCT t.TrainName) AS Train,
    GROUP_CONCAT(DISTINCT f.FlightNumber) AS Flight,
    GROUP_CONCAT(DISTINCT b.BusNumber) AS Bus,
    GROUP_CONCAT(DISTINCT c.CruiseName) AS Cruise
FROM 
    Destination d
LEFT JOIN 
    Trains t ON d.DestinationID = t.DestinationID
LEFT JOIN 
    Flights f ON d.DestinationID = f.DestinationID
LEFT JOIN 
    Buses b ON d.DestinationID = b.DestinationID
LEFT JOIN 
    Cruise c ON d.DestinationID = c.DestinationID
WHERE 
    d.DestinationName = 'Singapore'
GROUP BY 
    d.DestinationName;

SELECT B.BookingID, B.CustomerID, B.Booking_status,B.PaymentID, B.Booking_time, B.Transport, B.Origin, B.Destination, C.FullName,C.Email, C.Phone, C.Identity_proof
FROM Booking AS B JOIN CustomerDetails AS C ON B.CustomerID = C.CustomerID
JOIN Payment AS P ON B.PaymentID = P.PaymentID
WHERE P.PaymentMethod = 'Credit Card';

SELECT C.CustomerID, C.FullName, C.Email, C.Phone, C.Identity_proof, P.PaymentAmount FROM Payment AS P
JOIN CustomerDetails AS C ON P.CustomerID = C.CustomerID ORDER BY P.PaymentAmount DESC;

SELECT COUNT(*) AS Total_Mumbai_flights FROM Flights WHERE FL_Origin = 'Mumbai' OR FL_Destination = 'Mumbai';

-- used grouping
SELECT Department, MAX(Emp_salary) AS Max_EmpSalary, MIN(Emp_salary) AS Min_EmpSalary FROM Employee_reneeka GROUP BY Department;

SELECT T_Destination AS Destination FROM Trains INTERSECT SELECT FL_Destination AS Destination FROM Flights;
SELECT B_Destination FROM Buses WHERE B_Destination NOT IN (SELECT C_Destination FROM Car);

SELECT CustomerID, COUNT(*) AS CustomerBookings FROM Booking GROUP BY CustomerID HAVING COUNT(*) >= 2;

SELECT SUM(PaymentAmount) AS Total_Income FROM Payment;

CREATE VIEW Booking_Summary AS
SELECT COUNT(*) AS TotalBookings,SUM(p.PaymentAmount) AS TotalAmountPaid, AVG(p.PaymentAmount) AS AverageAmount
FROM Booking b JOIN Payment p ON b.PaymentID = p.PaymentID;
SELECT * FROM Booking_Summary;

CREATE VIEW DestinationS_Booked AS
SELECT Destination, COUNT(*) AS BookingCount FROM Booking_chahel GROUP BY Destination;
SELECT * FROM DestinationS_Booked;

SELECT Destination.DestinationID, Destination.DestinationName FROM Destination LEFT JOIN Booking ON Destination.DestinationID = Booking.Destination WHERE Booking.Destination IS NULL;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Booking WHERE Transport IN (SELECT TrainName FROM Trains);
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Booking;

SELECT Transport, COUNT(*) AS BookingCount
FROM Booking GROUP BY Transport ORDER BY COUNT(*) DESC LIMIT 1;

SELECT * FROM Destination;




