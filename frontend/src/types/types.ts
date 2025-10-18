export interface Product {
    id: number;
    name: string;
    category: string;
    unit: string;
    calories_per_unit: number;
    protein_per_unit?: number;
    carbs_per_unit?: number;
    fat_per_unit?: number;
    created_at?: string;
    updated_at?: string;
}

export interface Meal {
    id: number;
    name: string;
    category: string;
    person_id: number;
    ingredients?: MealIngredient[];
    created_at?: string;
    updated_at?: string;
}

export interface MealIngredient {
    id: number;
    meal_id: number;
    product_id: number;
    product?: Product;
    quantity: number;
}

export interface Person {
    id: number;
    name: string;
}

export type MealCategory = 'Breakfast' | 'Lunch' | 'Dinner' | 'Snack';