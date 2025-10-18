import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Layout from './components/layout/Layout';
import ProductsPage from './pages/ProductsPage';
import MealsPage from './pages/MealsPage';
import PlanningPage from './pages/PlanningPage';
import ShoppingListPage from './pages/ShoppingListPage';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<div className="p-4">Welcome to DietApp!</div>} />
          <Route path="products" element={<ProductsPage />} />
          <Route path="meals" element={<MealsPage />} />
          <Route path="planning" element={<PlanningPage />} />
          <Route path="shopping-list" element={<ShoppingListPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;