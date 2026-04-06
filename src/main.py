from fastapi import FastAPI

app = FastAPI(title="gem-template")


@app.get("/health")
def health() -> dict:
    return {"status": "ok"}
