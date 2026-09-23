-- V002: Sample data (synthetic - no real people)

INSERT INTO sales_rep (rep_id, first_name, last_name, email, commission_rate) VALUES
('15', 'Susan', 'Garcia', 'sgarcia@kimtay.example', 0.050),
('30', 'Daniel', 'Reeves', 'dreeves@kimtay.example', 0.060),
('45', 'Priya', 'Nair', 'pnair@kimtay.example', 0.055);

INSERT INTO customer (
    customer_id, first_name, last_name, email, phone, street, city, state, postal_code, credit_limit, rep_id
) VALUES
(101, 'Amara', 'Okafor', 'amara.okafor@mail.example', '719-555-0101', '12 Aspen Ln', 'Colorado Springs', 'CO', '80903', 1500.00, '15'),
(102, 'Ben', 'Carter', 'ben.carter@mail.example', '719-555-0102', '88 Pine St', 'Monument', 'CO', '80132', 750.00, '30'),
(103, 'Chloe', 'Nguyen', 'chloe.nguyen@mail.example', '303-555-0103', '4 Elm Ct', 'Denver', 'CO', '80202', 2000.00, '45'),
(104, 'Diego', 'Ramirez', 'diego.ramirez@mail.example', '719-555-0104', '301 Oak Ave', 'Peyton', 'CO', '80831', 500.00, '15'),
(105, 'Emily', 'Walsh', 'emily.walsh@mail.example', '719-555-0105', '19 Cedar Dr', 'Fountain', 'CO', '80817', 1000.00, '30'),
(106, 'Farah', 'Haddad', 'farah.haddad@mail.example', '720-555-0106', '7 Birch Rd', 'Aurora', 'CO', '80010', 1200.00, '45'),
(107, 'Grant', 'Lee', 'grant.lee@mail.example', '719-555-0107', '56 Spruce Way', 'Falcon', 'CO', '80831', 800.00, '15'),
(108, 'Hana', 'Sato', 'hana.sato@mail.example', '970-555-0108', '230 Maple St', 'Fort Collins', 'CO', '80521', 2500.00, '30'),
(109, 'Isaiah', 'Brooks', 'isaiah.brooks@mail.example', '719-555-0109', '9 Willow Ln', 'Woodland Park', 'CO', '80863', 600.00, '45'),
(110, 'Jade', 'Moreno', 'jade.moreno@mail.example', '719-555-0110', '415 Juniper Ct', 'Pueblo', 'CO', '81003', 900.00, '15');

INSERT INTO category (category_id, category_name) VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Bird'),
(4, 'Fish'),
(5, 'Small Animal');

INSERT INTO supplier (supplier_id, supplier_name, contact_email, payment_terms) VALUES
(1, 'Front Range Pet Wholesale', 'orders@frontrangepet.example', 'NET30'),
(2, 'Rocky Mountain Aquatics', 'sales@rmaquatics.example', 'NET45'),
(3, 'Peak Feed and Supply', 'hello@peakfeed.example', 'NET30');

INSERT INTO product (product_id, description, category_id, supplier_id, unit_price, on_hand) VALUES
('DF01', 'Premium Dry Dog Food 30 lb', 1, 3, 45.99, 120),
('DT02', 'Rope Chew Toy', 1, 1, 12.50, 200),
('DB03', 'Orthopedic Dog Bed - Large', 1, 1, 89.99, 25),
('DL04', 'Reflective Leash 6 ft', 1, 1, 18.75, 80),
('CF05', 'Indoor Cat Food 15 lb', 2, 3, 32.49, 90),
('CL06', 'Clumping Cat Litter 40 lb', 2, 3, 21.99, 150),
('CT07', 'Cat Scratching Post', 2, 1, 39.95, 30),
('BS08', 'Wild Bird Seed Mix 20 lb', 3, 3, 24.99, 60),
('BC09', 'Parakeet Cage Starter Kit', 3, 1, 74.50, 12),
('FA10', '20 Gallon Aquarium Kit', 4, 2, 129.99, 8),
('FF11', 'Tropical Fish Flakes', 4, 2, 7.25, 140),
('FW12', 'Aquarium Water Conditioner', 4, 2, 9.99, 75),
('SH13', 'Hamster Habitat Deluxe', 5, 1, 64.00, 15),
('SB14', 'Timothy Hay 5 lb', 5, 3, 16.49, 70),
('SW15', 'Small Animal Exercise Wheel', 5, 1, 22.95, 40);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(5001, 101, '2027-01-11', 'DELIVERED'),
(5002, 103, '2027-01-14', 'DELIVERED'),
(5003, 104, '2027-01-20', 'SHIPPED'),
(5004, 101, '2027-01-27', 'SHIPPED'),
(5005, 108, '2027-02-02', 'DELIVERED'),
(5006, 105, '2027-02-05', 'PENDING'),
(5007, 106, '2027-02-09', 'CANCELLED'),
(5008, 102, '2027-02-12', 'PENDING'),
(5009, 110, '2027-02-15', 'SHIPPED'),
(5010, 108, '2027-02-18', 'PENDING');

INSERT INTO order_line (order_id, product_id, quantity, quoted_price) VALUES
(5001, 'DF01', 2, 45.99),
(5001, 'DT02', 3, 12.50),
(5002, 'CF05', 1, 32.49),
(5002, 'CL06', 2, 21.99),
(5003, 'DB03', 1, 89.99),
(5004, 'DL04', 2, 18.75),
(5004, 'DF01', 1, 45.99),
(5005, 'FA10', 1, 129.99),
(5005, 'FF11', 4, 7.25),
(5005, 'FW12', 2, 9.99),
(5006, 'BS08', 3, 24.99),
(5007, 'SH13', 1, 64.00),
(5008, 'CT07', 1, 39.95),
(5009, 'SB14', 5, 16.49),
(5009, 'SW15', 1, 22.95),
(5010, 'BC09', 1, 74.50);
