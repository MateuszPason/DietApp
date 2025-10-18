import React from 'react';
import { Link, Outlet } from 'react-router-dom';

const Layout: React.FC = () => {
    return (
        <div className="min-h-screen bg-gray-50">
            {/* Navigation */}
            <nav className="bg-white shadow-sm">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16">
                        <div className="flex space-x-8">
                            <Link to="/" className="inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-900">
                                🍽️ DietApp
                            </Link>
                            <Link to="/products" className="inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-500 hover:text-gray-900">
                                Products
                            </Link>
                            <Link to="/meals" className="inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-500 hover:text-gray-900">
                                Meals
                            </Link> 
                            <Link to="/planning" className="inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-500 hover:text-gray-900">
                                Planning
                            </Link>
                            <Link to="/shopping-list" className="inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-500 hover:text-gray-900">
                                Shopping List
                            </Link>
                        </div>
                    </div>
                </div>
            </nav>

            {/* Main content */}
            <main className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
                <Outlet />
            </main>
        </div>
    );
};

export default Layout;