package com.flair.server.parser;

import com.flair.server.parser.corenlp.StopwordAnnotator;
import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.pipeline.Annotation;
import edu.stanford.nlp.util.CoreMap;
import edu.stanford.nlp.util.Lazy;
import edu.stanford.nlp.util.Pair;

import java.util.List;
import java.util.stream.Collectors;

/*
 * Thin wrapper around the Stanford CoreNLP annotations
 */
public class StanfordDocumentParserAnnotation implements ParserAnnotations {
	static final class Token implements ParserAnnotations.Token {
		final CoreLabel source;

		Token(CoreLabel source) {
			this.source = source;
		}

		@Override
		public String word() {
			return source.word();
		}
		@Override
		public String lemma() {
			if (source.lemma() == null)
				return "";
			else
				return source.lemma();
		}
		@Override
		public String pos() {
			return source.get(CoreAnnotations.PartOfSpeechAnnotation.class);
		}
		@Override
		public boolean isStopword() {
			Pair<Boolean, Boolean> stopword = source.get(StopwordAnnotator.class);
			return stopword.first || stopword.second;
		}
	}

	static final class Sentence implements ParserAnnotations.Sentence {
		final CoreMap source;
		final Lazy<List<Token>> tokenCache;

		Sentence(CoreMap source) {
			this.source = source;
			tokenCache = Lazy.cache(() -> source.get(CoreAnnotations.TokensAnnotation.class).stream().map(Token::new).collect(Collectors.toList()));
		}

		@Override
		public int start() {
			return source.get(CoreAnnotations.CharacterOffsetBeginAnnotation.class);
		}
		@Override
		public int end() {
			return source.get(CoreAnnotations.CharacterOffsetEndAnnotation.class);
		}
		@Override
		public String text() {
			return source.get(CoreAnnotations.TextAnnotation.class);
		}
		@Override
		public Iterable<? extends ParserAnnotations.Token> tokens() {
			return tokenCache.get();
		}
	}

	private final Annotation annotation;
	private final Lazy<List<Sentence>> sentenceCache;

	StanfordDocumentParserAnnotation(Annotation annotation) {
		this.annotation = annotation;
		sentenceCache = Lazy.cache(() -> annotation.get(CoreAnnotations.SentencesAnnotation.class).stream().map(Sentence::new).collect(Collectors.toList()));
	}

	public Annotation getAnnotation() {
		return annotation;
	}

	@Override
	public Iterable<? extends ParserAnnotations.Sentence> sentences() {
		return sentenceCache.get();
	}

	@Override
	public DocumentParserType type() {
		return DocumentParserType.STANFORD_CORENLP;
	}
	@Override
	public <T extends ParserAnnotations> T data(Class<T> typeClass) {
		if (typeClass != this.getClass())
			throw new IllegalArgumentException("Couldn't convert " + this.getClass().getSimpleName() + " into " + typeClass.getSimpleName());

		return typeClass.cast(this);
	}
}
