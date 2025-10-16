from pydantic_settings import BaseSettings
from typing import Optional

class Settings(BaseSettings):
    DATABASE_URL: str

    DEBUG: bool = False
    APP_TITLE: str = "DietApp API"
    APP_VERSION: str = "1.0.0"
    APP_DESCRIPTION: str = "Personal diet planning and meal management application"

    HOST: str = "0.0.0.0"
    PORT: int = 8000

    CORS_ORIGINS: list = ["http://localhost:5173", "http://localhost:3000"]

    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings()