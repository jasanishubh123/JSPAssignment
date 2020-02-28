/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tags;

import java.io.StringWriter;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author snehal
 */
public class TagHandler2 extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            StringWriter s=new StringWriter();
            getJspBody().invoke(s);
            out.println(s.toString());

            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }

            
            // out.println("    </blockquote>");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in TagHandler2 tag", ex);
        }
    }
    
}
