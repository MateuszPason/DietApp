from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.config import settings
from app.api.v1 import products, meals, meal_plan

app = FastAPI(
    title=settings.APP_TITLE,
    version=settings.APP_VERSION,
    description=settings.APP_DESCRIPTION,
    docs_url = "/docs",
    redoc_url = "/redoc"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/", tags=["Root"])
async def root():
    return {
        "message": "Welcome to DietApp API",
        "version": settings.APP_VERSION,
        "docs": "/docs"
    }

@app.get("/health", tags=["Health"])
async def health_check():
    return {"status": "healthy"}


app.include_router(products.router, prefix="/api/v1", tags=["Products"])
app.include_router(meals.router, prefix="/api/v1", tags=["Meals"])
app.include_router(meal_plan.router, prefix="/api/v1", tags=["Meals Plans"])

@app.on_event("startup")
async def startup_event():
    print(f"{settings.APP_TITLE} v{settings.APP_VERSION} starting...")
    print(f"API Documentation: http://{settings.HOST}:{settings.PORT}/docs")


@app.on_event("shutdown")
async def shutdown_event():
    print(f"{settings.APP_TITLE} shutting down...")    