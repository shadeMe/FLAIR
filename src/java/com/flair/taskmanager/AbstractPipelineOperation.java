/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
 
 */
package com.flair.taskmanager;

/**
 * Represents the interface of a (possibly executing) pipeline operation. A Future essentially.
 * @author shadeMe
 */
public interface AbstractPipelineOperation
{
    public PipelineOperationType	getType();
    
    public void				begin();
    public boolean			isCancelled();
    public void				cancel();
    public boolean			isCompleted();	    // returns true if the op was cancelled
    public void				registerCompletionListener(AbstractPipelineOperationCompletionListener listener);
    
    public Object			getOutput();
}
