/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 
 */
package com.flair.parser;

import com.flair.grammar.GrammaticalConstruction;
import com.flair.grammar.Language;

/**
 * The interface all parsable documents must implement
 * @author shadeMe
 */
public interface AbstractDocument extends Comparable<AbstractDocument>
{
    public AbstractDocumentSource			getDocumentSource();
    public Language					getLanguage();
    public String					getText();
    public String					getDescription();
    public DocumentConstructionData			getConstructionData(GrammaticalConstruction type);
    
    public double					getReadabilityScore();
    public String					getReadabilityLevel();
    
    public int						getNumCharacters();
    public int						getNumSentences();
    public int						getNumDependencies();
    
    public double					getAvgWordLength();
    public double					getAvgSentenceLength();
    public double					getAvgTreeDepth();
    
    public void						setNumCharacters(int value);
    public void						setNumSentences(int value);
    public void						setNumDependencies(int value);
    
    public void						setAvgWordLength(double value);
    public void						setAvgSentenceLength(double value);
    public void						setAvgTreeDepth(double value);
    
    public int						getLength();
    public void						setLength(int value);
    public double					getFancyLength();
    
    public boolean					isParsed();
    public void						flagAsParsed();
}

