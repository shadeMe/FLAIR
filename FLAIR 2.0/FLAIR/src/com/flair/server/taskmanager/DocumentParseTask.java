/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 
 */
package com.flair.server.taskmanager;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import com.flair.server.parser.AbstractDocument;
import com.flair.server.parser.AbstractDocumentKeywordSearcher;
import com.flair.server.parser.AbstractDocumentParser;
import com.flair.server.parser.AbstractDocumentSource;
import com.flair.server.parser.AbstractParsingStrategy;
import com.flair.server.parser.KeywordSearcherInput;
import com.flair.server.parser.KeywordSearcherOutput;
import com.flair.server.utilities.FLAIRLogger;
import com.flair.server.utilities.SimpleObjectPoolResource;

/**
 * Parses a document source and returns a parsed document
 * 
 * @author shadeMe
 */
class DocumentParseTask extends AbstractTask<DocumentParseTaskResult>
{
	static final class Executor extends AbstractTaskExecutor
	{
		private final ExecutorService auxThreadPool; // to allow timeouts

		private Executor()
		{
			super(Constants.PARSER_THREADPOOL_SIZE);
			auxThreadPool = Executors.newFixedThreadPool(Constants.PARSER_THREADPOOL_SIZE);
		}

		public void parse(DocumentParseTask task) 
		{
			task.setParseExecutor(auxThreadPool);
			queue(task);
		}
	}
	
	public static final Executor getExecutor() {
		return new Executor();
	}
	
	private static final int 						TIMEOUT_SECONDS = 5 * 60;
	
	
	private final AbstractDocumentSource			input;
	private final AbstractParsingStrategy			strategy;
	private final DocumentParserPool				parserPool;
	private final AbstractDocumentKeywordSearcher	keywordSearcher;
	private final KeywordSearcherInput				keywordSearcherInput;
	private ExecutorService							parseExecutor;

	final class ParseRunnable implements Callable<AbstractDocument>
	{
		private final AbstractDocumentParser			parser;
		
		public ParseRunnable(AbstractDocumentParser parser) {
			this.parser = parser;
		}

		@Override
		public AbstractDocument call() 
		{
			AbstractDocument output = parser.parse(input, strategy);
			if (output.isParsed() == false)
				throw new IllegalStateException("Parser didn't set the document's parsed flag");

			KeywordSearcherOutput keywordData = keywordSearcher.search(output, keywordSearcherInput);
			output.setKeywordData(keywordData);
			return output;
		}
	}

	public DocumentParseTask(AbstractJob<?, ?> job,
							AbstractDocumentSource source,
							AbstractParsingStrategy strategy,
							DocumentParserPool parserPool,
							AbstractDocumentKeywordSearcher keywordSearcher,
							KeywordSearcherInput keywordSearcherInput)
	{
		super(TaskType.PARSE_DOCUMENT, job, new BasicTaskLinker<DocumentParseTaskResult>(job));

		this.input = source;
		this.strategy = strategy;
		this.parserPool = parserPool;
		this.keywordSearcher = keywordSearcher;
		this.keywordSearcherInput = keywordSearcherInput;
		this.parseExecutor = null;
	}

	protected void setParseExecutor(ExecutorService executor) {
		this.parseExecutor = executor;
	}

	@Override
	protected DocumentParseTaskResult performTask()
	{
		if (parseExecutor == null)
			throw new IllegalStateException("Auxiliary threadpool not set");
		else if (parserPool == null)
			throw new IllegalStateException("Parser pool not set");
		else if (keywordSearcher == null)
			throw new IllegalStateException("Keyword searcher not set");

		AbstractDocument output = null;
		SimpleObjectPoolResource<AbstractDocumentParser> parserPoolData = null;
		long startTime = 0;
		boolean error = false;

		try
		{
			parserPoolData = parserPool.get();
			FutureTask<AbstractDocument> wrapper = new FutureTask<>(new ParseRunnable(parserPoolData.get()));
			startTime = System.currentTimeMillis();
			parseExecutor.submit(wrapper).get(TIMEOUT_SECONDS, TimeUnit.SECONDS);
			output = wrapper.get();
		} catch (TimeoutException ex)
		{
			FLAIRLogger.get().error("Document parsing task timed-out for " + input.toString());
			output = null;
			error = true;
		} catch (Throwable ex)
		{
			FLAIRLogger.get().error(ex, "Document parsing task encountered an error. Exception: " + ex.toString());
			output = null;
			error = true;
		} finally
		{
			if (parserPoolData != null)
				parserPoolData.release();
		}

		long endTime = System.currentTimeMillis();
		if (false == error)
			FLAIRLogger.get()
					.trace("Document " + output.getDescription() + " parsed in " + (endTime - startTime) + " ms");

		DocumentParseTaskResult result = new DocumentParseTaskResult(output);
		return result;
	}
}

class DocumentParseTaskResult
{
	private final AbstractDocument output;

	public DocumentParseTaskResult(AbstractDocument output) {
		this.output = output;
	}

	public AbstractDocument getOutput() {
		return output;
	}
}