/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

 */
package com.flair.server.parser;

import com.flair.shared.grammar.GrammaticalConstruction;
import com.flair.shared.grammar.Language;
import com.flair.shared.parser.DocumentReadabilityLevel;

/**
 * The interface all parsable documents must implement
 *
 * @author shadeMe
 */
public interface AbstractDocument extends Comparable<AbstractDocument> {
	AbstractDocumentSource getDocumentSource();
	Language getLanguage();
	String getText();
	String getSpanText(TextSegment span);

	String getDescription();
	Iterable<GrammaticalConstruction> getSupportedConstructions();    // returns the constructions pertinent to the doc's language
	DocumentConstructionData getConstructionData(GrammaticalConstruction type);
	ParserAnnotations getParserAnnotations();

	double getReadabilityScore();
	DocumentReadabilityLevel getReadabilityLevel();

	int getNumCharacters();
	int getNumSentences();
	int getNumDependencies();
	int getNumWords();
	int getNumTokens();

	double getAvgWordLength();
	double getAvgSentenceLength();
	double getAvgTreeDepth();

	void setNumCharacters(int value);
	void setNumSentences(int value);
	void setNumDependencies(int value);
	void setNumWords(int value);
	void setNumTokens(int value);

	void setAvgWordLength(double value);
	void setAvgSentenceLength(double value);
	void setAvgTreeDepth(double value);

	int getLength();
	void setLength(int value);
	double getGramL2Norm();

	KeywordSearcherOutput getKeywordData();
	void setKeywordData(KeywordSearcherOutput data);

	boolean isParsed();
	void flagAsParsed(ParserAnnotations annotations);
}
