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
public class StringFormat extends SimpleTagSupport {

    private String scolor="red";
    private String msg;

    public void setMsg(String msg) {
        this.msg = msg;
    }

    
    StringWriter s=new StringWriter();
    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        
        
        try {
            if (scolor != null) {
         /* Use message from attribute */
         JspWriter out = getJspContext().getOut();
         out.println( "<b style='color:"+scolor+";'> <u>"+ msg +"  </u></b> " );
      } else {
         /* use message from the body */
         getJspBody().invoke(s);
         getJspContext().getOut().println(s.toString());
      }
            

//            JspFragment f = getJspBody();
//            if (f != null) {
//                f.invoke(s);
//            }

            // TODO: insert code to write html after writing the body content.
            // e.g.:
            //
            // out.println("    </blockquote>");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in StringFormat tag", ex);
        }
    }
    
}
