from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.database import get_db

router = APIRouter()

@router.get("/meals")
async def get_meals(db: Session = Depends(get_db)):
    return {"message": "Meals endpoint - coming soon"}