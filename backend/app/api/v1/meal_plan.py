from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.database import get_db

router = APIRouter()

@router.get("/meal-plans")
async def get_meal_plans(db: Session = Depends(get_db)):
    return {"message": "Meal plans endpoint - coming soon"}