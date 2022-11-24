import logging

import nltk

nltk.download("punkt")


class Tokenize:
    def __init__(self):
        self.LOG = logging.getLogger()

    def words(self, text):
        self.LOG.info("Generating words for text: {}", text)
        word_tokens = nltk.word_tokenize(text)
        return word_tokens

    def sentences(self, text):
        self.LOG.info("Generating sentences for text: {}", text)
        sent_token = nltk.sent_tokenize(text)
        return sent_token
