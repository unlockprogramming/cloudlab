from fastapi import FastAPI
from src.tokenize import Tokenize
from src.vader import Vader

app = FastAPI()
tokenize = Tokenize()
vader = Vader()


@app.get("/sentiment-scores")
def sentiment_api(text: str, model_name: str):
    if model_name == "VADER":
        return vader.score(text)
    else:
        raise Exception("Invalid token type")


@app.get("/tokenize")
def tokenize_api(text: str, token_type: str):
    if token_type == "WORDS":
        return tokenize.words(text)
    elif token_type == "SENTENCES":
        return tokenize.sentences(text)
    else:
        raise Exception("Invalid token type")
