package com.flair.client.model.interfaces;

import com.flair.shared.grammar.GrammaticalConstruction;
import com.flair.shared.interop.RankableDocument;

/*
 * Input for the DocumentAnnotator class
 */
public interface DocumentAnnotatorInput
{
	public interface HighlightText
	{
		public RankableDocument							getDocument();
		
		public Iterable<GrammaticalConstruction>		getAnnotatedConstructions();						// constructions that need to be annotated
		public String									getConstructionAnnotationColor(GrammaticalConstruction gram);	// the color string for the construction
		public String									getConstructionTitle(GrammaticalConstruction gram);	// the text to be displayed on mouse-over
		
		public boolean									shouldAnnotateKeywords();		// true if keywords are to be annotated
		public String									getKeywordAnnotationColor();
		public String									getKeywordTitle();
	}
	
	public interface ExportAnnotation
	{
		public RankableDocument							getDocument();
		public Iterable<GrammaticalConstruction>		getAnnotationConstructions();
		public boolean									shouldAnnotateKeywords();		// true if keywords are to be annotated
	}
}
