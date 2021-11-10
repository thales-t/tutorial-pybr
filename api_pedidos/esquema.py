from pydantic import BaseModel


class HealthCheckResponse(BaseModel):
    status: str


class Item(BaseModel):
    sku: str
    description: str
    image_url: str
    reference: str
    quantity: int


class ErrorResponse(BaseModel):
    message: str
