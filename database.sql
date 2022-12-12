
-- user
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(255) UNIQUE NOT NULL,
    "password" VARCHAR(1000) NOT NULL,
	"email" VARCHAR(255),
	"auth_token" VARCHAR(255),
	"auth_token_sent_at" TIMESTAMPTZ,
	"access_group" VARCHAR(255),
	"investor_id" INTEGER REFERENCES "user"
);

-- section
CREATE TABLE "section" (
	"id" SERIAL PRIMARY KEY,
	"section" VARCHAR(255)
);

INSERT INTO "section" ("section")
VALUES ('Introduction'), ('Team'), ('Business Model'), ('Product and Market'), ('IP and Legal');

-- question
CREATE TABLE "question" (
	"id" SERIAL PRIMARY KEY,
	"question" VARCHAR(500) NOT NULL,
	"created_at" TIMESTAMPTZ,
	"updated_at" TIMESTAMPTZ, 
	"active" BOOLEAN DEFAULT FALSE,
	"position" INTEGER,
	"section_id" INTEGER REFERENCES "section"
);

INSERT INTO "question" ("question", "active", "position", "section_id") 
VALUES ('Company Name:', TRUE, '1', '1'),
('Founder(s) Name(s):', TRUE, '2', '1'),
('Founder Email:', TRUE, '3', '1'),
('Headquarter Location:', TRUE, '4', '1'),
('Website:', TRUE, '5', '1'),
('How many founders does the company have?', TRUE, '1', '2'),
('How much did the founders invest in the company in terms of capital collectively so far?', TRUE, '2', '2'),
('Are the majority of the founders involved in other companies or occupations?', TRUE, '3', '2'),
('What is the average age of the founders?', TRUE, '4', '2'),
('Have any of the founders have previous entrepreneurial experience?', TRUE, '5', '2'),
('How many employees work for the company? (excluding founders, interns, and freelancers)', TRUE, '6', '2'),
('How long have the members of the core team worked (or studied together)?', TRUE, '7', '2'),
('How many years of relevant industry experience does the core team have collectively?', TRUE, '8', '2'),
('Does any of the core team have business and managerial background?', TRUE, '9', '2'),
('Does the core team have all the main technical skills? (i.e. web development for online services)', TRUE, '10', '2'),
('Is the business scalable? (Can you significantly increase revenue without increasing costs)', TRUE, '1', '3'),
('The company''s main business model is:', TRUE, '2', '3'),
('Which stage of development are you facing now?', TRUE, '3', '3'),
('Is the company sustainably breakeven?', TRUE, '4', '3'),
('Does the company have a board of advisors?', TRUE, '5', '3'),
('How many advisors/board members?', TRUE, '6', '3'),
('Indicate which, if any, of the following entities are shareholders of the company?', TRUE, '7', '3'),
('Does the company offer valuable exit strategies to investors?', TRUE, '8', '3'),
('In which country is the company based?', TRUE, '1', '4'),
('What industry is your product in? (Select all that apply)', TRUE, '2', '4'),
('How would you define the status of the product/service roll out?', TRUE, '3', '4'),
('Has the demand for the proposed product/service been tested?', TRUE, '4', '4'),
('What is the current size of your Total Addressable Market?', TRUE, '5', '4'),
('How high are the barriers to entry of the market the company is targeting for potential competitors? (The effort/cost that must be sustained by a potential competitor to enter the market)', TRUE, '6', '4'),
('How would you define the level of competition in your targeted market?', TRUE, '7', '4'),
('Existing competitive products/services are:', TRUE, '8', '4'),
('How would you define your product compared to the ones of existing competitors?', TRUE, '9', '4'),
('How do you relate to international competition?', TRUE, '10', '4'),
('Do you plan international expansion?', TRUE, '11', '4'),
('How is the average trend of feedback received so far from early adopters/industry experts?', TRUE, '12', '4'),
('How would you define the degree of loyalty of your customers?', TRUE, '13', '4'),
('How strong are the relationships with key strategic partners (including distributors, suppliers)', TRUE, '14', '4'),
('When was the company started?', TRUE, '1', '5'),
('Has the legal entity been incorporated?', TRUE, '2', '5'),
('Year of Incorporation:', TRUE, '3', '5'),
('Can the company and its founders already depend on the support of external legal consultants?', TRUE, '4', '5'),
('Which kind of Intellectual Property (IP) applies to the product/service?', TRUE, '5', '5'),
('How would you define the current stage of development of your IP?', TRUE, '6', '5');

-- choice
CREATE TABLE "choice" (
	"id" SERIAL PRIMARY KEY,
	"question_id" INTEGER REFERENCES "question",
	"choice" VARCHAR(500),
	"position" INTEGER
);

INSERT INTO "choice" ("question_id", "choice", "position")
VALUES ('4', 'ALABAMA', '1'),
('4', 'ALASKA', '2'),
('4', 'ARIZONA', '3'),
('4', 'ARKANSAS', '4'),
('4', 'CALIFORNIA', '5'),
('4', 'COLORADO', '6'),
('4', 'CONNECTICUT', '7'),
('4', 'DELAWARE', '8'),
('4', 'DISTRICT OF COLUMBIA', '9'),
('4', 'FLORIDA', '10'),
('4', 'GEORGIA', '11'),
('4', 'HAWAII', '12'),
('4', 'IDAHO', '13'),
('4', 'ILLINOIS', '14'),
('4', 'INDIANA', '15'),
('4', 'IOWA', '16'),
('4', 'KANSAS', '17'),
('4', 'KENTUCKY', '18'),
('4', 'LOUISIANA', '19'),
('4', 'MAINE', '20'),
('4', 'MARYLAND', '21'),
('4', 'MASSACHUSETTS', '22'),
('4', 'MICHIGAN', '23'),
('4', 'MINNESOTA', '24'),
('4', 'MISSISSIPPI', '25'),
('4', 'MISSOURI', '26'),
('4', 'MONTANA', '27'),
('4', 'NEBRASKA', '28'),
('4', 'NEVADA', '29'),
('4', 'NEW HAMPSHIRE', '30'),
('4', 'NEW JERSEY', '31'),
('4', 'NEW MEXICO', '32'),
('4', 'NEW YORK', '33'),
('4', 'NORTH CAROLINA', '34'),
('4', 'NORTH DAKOTA', '35'),
('4', 'OHIO', '36'),
('4', 'OKLAHOMA', '37'),
('4', 'OREGON', '38'),
('4', 'PENNSYLVANIA', '39'),
('4', 'RHODE ISLAND', '40'),
('4', 'SOUTH CAROLINA', '41'),
('4', 'SOUTH DAKOTA', '42'),
('4', 'TENNESSEE', '43'),
('4', 'TEXAS', '44'),
('4', 'UTAH', '45'),
('4', 'VERMONT', '46'),
('4', 'VIRGINIA', '47'),
('4', 'WASHINGTON', '48'),
('4', 'WEST VIRGINIA', '49'),
('4', 'WISCONSIN', '50'),
('4', 'WYOMING', '51'),
('8', 'Yes, We see the company as a side project to our current occupation', '1'),
('8', 'Yes, but we are committed part time on a continuous basis', '2'),
('8', 'Yes, but we are committed part time on a continuous basis and plan to commit full time once the organizational structure of the company is fully operational', '3'),
('8', 'No, we are committed full time', '4'),
('9', '<25', '1'),
('9', '25-34', '2'),
('9', '35-45', '3'),
('9', '>45', '4'),
('10', 'This is the first entrepreneurial experience for all of us', '1'),
('10', 'Yes, at least one of us previously founded a company', '1'),
('10', 'Yes, and at least of of us successfully exited a company', '1'),
('12', 'Less than 1 year', '1'),
('12', 'Between 1 and 2 years', '2'),
('12', 'Between 3 and 5 years', '3'),
('12', 'More than 5 years', '4'),
('14', 'No', '1'),
('14', 'At least one of us has accomplished business-related studies', '2'),
('14', 'At least one of us has work experience', '3'),
('14', 'At least one of us has been employed as a mid-level manager (ie. Product manager, Sales manager)', '4'),
('14', 'At least one of us has been employed as a top-tier manager (VP and above positions) or has held a similar position in his or her own company which had more than 50 employees', '5'),
('15', 'No', '1'),
('15', 'No, but we outsource', '2'),
('15', 'We have some technical capabilities and outsource the rest', '3'),
('15', 'We have the majority of the technical capabilities and outsource the rest', '4'),
('15', 'Yes', '5'),
('16', 'Yes', '1'),
('16', 'No', '2'),
('17', 'B2C', '1'),
('17', 'B2B', '2'),
('18', 'Idea stage: working on a business plan and testing the initial assumptions', '1'),
('18', 'Development: working on product and setting up operations', '2'),
('18', 'Startup Stage: already active with revenues up to $250k', '3'),
('18', 'Expansion Stage: already active with revenues above $250k looking to scale up operations', '4'),
('19', 'Yes', '1'),
('19', 'No', '2'),
('20', 'Yes', '1'),
('20', 'We can count on external advisors but they are not organized in a board yer', '2'),
('20', 'No', '3'), ('22', 'Friends and Family', '1'),
('22', 'Crowdfunding', '2'),
('22', 'Incubator/Accelerator', '3'),
('22', 'Business Angel', '4'),
('22', 'Venture Capitalist', '5'),
('23', 'We did not consider exit strategies so far', '1'),
('23', 'We considered some exit strategies', '2'),
('23', 'We have multiple exit opportunities', '3'),
('23', 'Companies active in the market have expressed interest in merger or acquisition', '4'),
('23', 'Large companies have demonstrated strong interest and willingness to commit to acquisition', '5'),
('25', 'Administrative Services', '1'),
('25', 'Advertising', '2'),
('25', 'Agriculture & Farming', '3'),
('25', 'Artificial Intelligence', '4'),
('25', 'Biotechnology', '5'),
('25', 'Clothing & Apparel', '6'),
('25', 'Commerce & Shopping', '7'),
('25', 'Community & Lifestyle', '8'),
('25', 'Consumer Electronics', '9'),
('25', 'Consumer Goods', '10'),
('25', 'Content & Publishing', '11'),
('25', 'Data & Analytics', '12'),
('25', 'Design', '13'),
('25', 'Education', '14'),
('25', 'Energy', '15'),
('25', 'Financial Services', '16'),
('25', 'Food & Beverage', '17'),
('25', 'Gaming', '18'),
('25', 'Government & Military', '19'),
('25', 'Hardware', '20'),
('25', 'Health Care', '21'),
('25', 'Information Technology', '22'),
('25', 'Lending & Investments', '23'),
('25', 'Manufacturing', '24'),
('25', 'Media & Entertainment', '25'),
('25', 'Natural Resources', '26'),
('25', 'Payments', '27'),
('25', 'Privacy & Security', '28'),
('25', 'Professional Services', '29'),
('25', 'Real Estate', '30'),
('25', 'Sales & Marketing', '31'),
('25', 'Science & Engineering', '32'),
('25', 'Sustainability', '33'),
('25', 'Transportation', '34'),
('25', 'Travel & Tourism', '35'),
('26', 'Planning: the roll-out process has not begun', '1'),
('26', 'Prototype: we have the first version of the product (alpha or testing/display purposes, but it’s not ready for the market', '2'),
('26', 'MVP: we have a minimum viable product (with just enough features to satisfy early adopters) released to the market', '3'),
('26', 'Market: the complete version of the product offered to the market', '4'),
('27', 'No, we are still under testing stage', '1'),
('27', 'Yes, the demand has been validated by our main competitors', '2'),
('27', 'Yes, the demand has been extensively tested and validated', '3'),
('29', 'Very Low', '1'),
('29', 'Low', '2'),
('29', 'Modest', '3'),
('29', 'High', '4'),
('29', 'Very High', '5'),
('30', 'Dominated by a single player', '1'),
('30', 'Dominated by several players', '2'),
('30', 'Many small players', '3'),
('30', 'Some small players', '4'),
('30', 'Blue Ocean (negligible competition)', '5'),
('31', 'Excellent', '1'),
('31', 'Good', '2'),
('31', 'Weak', '3'),
('32', 'Comparable', '1'),
('32', 'Comparable, but we innovate in terms of marketing prop/UVP', '2'),
('32', 'Comparable, but radically innovate in terms of execution (team, costs, manufacturing, etc)', '3'),
('32', 'Current products solve the same needs with non comparable solution', '4'),
('33', 'Competition abroad is unknown', '1'),
('33', 'Competition abroad is already established', '2'),
('33', 'Competition abroad is growing but foreign markets are smaller than the one in our country', '3'),
('33', 'Competition abroad is not yet developed', '4'),
('34', 'We are locally based; international expansion is not an option for us', '1'),
('34', 'International expansion entails big challenges for us', '2'),
('34', 'We are considering expanding to international markets in the future', '3'),
('34', 'We currently have a plan for international expansion', '4'),
('34', 'Our main strategic focus is already global', '5'),
('35', 'Mainly negative', '1'),
('35', 'Fairly negative', '2'),
('35', 'Fairly positive', '3'),
('35', 'Mainly positive', '4'),
('35', 'All positive', '5'),
('36', 'Still to be tested/under testing', '1'),
('36', 'Low retention: the business model requires time to develop higher retention', '2'),
('36', 'Average retention: already at a good level and can be further improved', '3'),
('36', 'High retention: high level of loyalty already developed with customers', '4'),
('37', 'No partners contacted so far', '1'),
('37', 'We identified and contacted them', '2'),
('37', 'Informal agreements already in place', '3'),
('37', 'Contracts signed', '4'),
('37', 'Contracts signed and serving high volumes', '5'),
('39', 'Yes', '1'),
('39', 'No', '2'),
('41', 'Yes', '1'),
('41', 'No', '2'),
('42', 'Trademark and/or domain names', '1'),
('42', 'Copyright', '2'),
('42', 'Patent', '3'),
('42', 'Other', '4'),
('43', 'Not applicable', '1'),
('43', 'IP pending for approval', '2'),
('43', 'IP protection secured at regional level', '3'),
('43', 'IP protection secured at global level', '4');

-- response
CREATE TABLE "response" (
	"id" SERIAL PRIMARY KEY,
	"question_id" INTEGER REFERENCES "question",
	"response" VARCHAR(500),
	"user_id" INTEGER REFERENCES "user",
	"created_at" TIMESTAMPTZ,
	"updated_at" TIMESTAMPTZ
);

-- submission
CREATE TABLE "submission" (
	"id" SERIAL PRIMARY KEY,
	"completed" BOOLEAN DEFAULT FALSE,
	"completed_at" TIMESTAMPTZ,
	"requested_at" TIMESTAMPTZ,
	"founder_id" INTEGER REFERENCES "user",
	"cfi_id" INTEGER REFERENCES "user",
	"report" VARCHAR(1000),
	"valuation" VARCHAR(255)
);
