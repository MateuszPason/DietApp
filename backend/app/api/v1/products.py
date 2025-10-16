from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.database import get_db

router = APIRouter()

@router.get("/products")
async def get_products(db: Session = Depends(get_db)):
    return {"message": "Products endpoint - coming soon"}

@router.post("/products")
async def create_product(db: Session = Depends(get_db)):
    return {"message": "Create product endpoint - coming soon"}