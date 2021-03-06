
package com.flair.server.document;

import com.flair.shared.grammar.GrammaticalConstruction;
import com.flair.shared.grammar.Language;

import java.util.EnumMap;

/**
 * A table of construction data mapped to constructions
 */
class ConstructionDataCollection {
	private final EnumMap<GrammaticalConstruction, AbstractConstructionData> dataStore;

	public ConstructionDataCollection(Language lang, AbstractConstructionDataFactory prototypeFactory) {
		dataStore = new EnumMap<>(GrammaticalConstruction.class);

		for (GrammaticalConstruction itr : GrammaticalConstruction.getForLanguage(lang))
			dataStore.put(itr, prototypeFactory.create(itr));
	}

	public AbstractConstructionData getData(GrammaticalConstruction type) {
		return dataStore.get(type);
	}
}
