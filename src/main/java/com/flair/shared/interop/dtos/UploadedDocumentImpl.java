package com.flair.shared.interop.dtos;

import com.flair.shared.grammar.Language;

/*
 * Serializable contents of an uploaded document
 */
public class UploadedDocumentImpl implements UploadedDocument {
	String operationId;
	int linkingId;
	Language language;
	String title;
	String snippet;
	String text;

	public UploadedDocumentImpl() {
		linkingId = 0;
		language = null;
		title = snippet = text = "";
	}

	@Override
	public Language getLanguage() {
		return language;
	}

	@Override
	public String getTitle() {
		return title;
	}

	@Override
	public String getSnippet() {
		return snippet;
	}

	@Override
	public String getText() {
		return text;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public int getLinkingId() {
		return linkingId;
	}

	public void setLinkingId(int id) {
		linkingId = id;
	}

	@Override
	public String getOperationId() {
		return operationId;
	}
	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}
}
