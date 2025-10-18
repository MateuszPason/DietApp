import React from 'react';

const ShoppingListPage: React.FC = () => {
    return (
        <div className="px-4 sm:px-6 lg:px-8">
            <h1 className="text-3xl font-bold text-gray-900">Shoppig List</h1>
            <p className="mt-2 text-sm text-gray-700">
                Generate your shopping list based on planned meals.
            </p>
        </div>
    );
};

export default ShoppingListPage;