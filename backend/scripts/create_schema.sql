-- Database: DietApp Schema Creation Script
-- Run this after creating the database

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS daily_meal_plans CASCADE;
DROP TABLE IF EXISTS weekly_plans CASCADE;
DROP TABLE IF EXISTS meal_ingredients CASCADE;
DROP TABLE IF EXISTS meals CASCADE;
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS products CASCADE;

-- Products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    category VARCHAR(100) NOT NULL,
    unit VARCHAR(50) NOT NULL, -- 'g', 'ml', 'szt' (pieces)
    calories_per_unit DECIMAL(10, 2) NOT NULL, -- per 100g or per piece
    protein_per_unit DECIMAL(10, 2),
    carbs_per_unit DECIMAL(10, 2),
    fat_per_unit DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- People table
CREATE TABLE people (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Meals table
CREATE TABLE meals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL, -- 'Śniadanie', 'Obiad', 'Kolacja', etc.
    person_id INTEGER REFERENCES people(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Meal ingredients (many-to-many with quantities)
CREATE TABLE meal_ingredients (
    id SERIAL PRIMARY KEY,
    meal_id INTEGER REFERENCES meals(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    quantity DECIMAL(10, 2) NOT NULL, -- in product's unit
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(meal_id, product_id)
);

-- Weekly meal plans
CREATE TABLE weekly_plans (
    id SERIAL PRIMARY KEY,
    week_number INTEGER,
    year INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Daily meal selections
CREATE TABLE daily_meal_plans (
    id SERIAL PRIMARY KEY,
    weekly_plan_id INTEGER REFERENCES weekly_plans(id) ON DELETE CASCADE,
    meal_id INTEGER REFERENCES meals(id) ON DELETE CASCADE,
    day_of_week INTEGER NOT NULL, -- 1-7 (Monday-Sunday)
    multiplier DECIMAL(3, 1) DEFAULT 1.0, -- for double portions, etc.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for performance
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_meals_person_id ON meals(person_id);
CREATE INDEX idx_meal_ingredients_meal_id ON meal_ingredients(meal_id);
CREATE INDEX idx_meal_ingredients_product_id ON meal_ingredients(product_id);
CREATE INDEX idx_daily_meal_plans_weekly_plan_id ON daily_meal_plans(weekly_plan_id);
CREATE INDEX idx_weekly_plans_year_week ON weekly_plans(year, week_number);