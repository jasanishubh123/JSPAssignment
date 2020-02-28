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
public class StringCustomAttribute extends SimpleTagSupport {

    String togglestr="";
    String reversestr="";
    char charreverse[]="".toCharArray();
    char chartoggle[]="".toCharArray();

    public String getTogglestr() {
        return togglestr;
    }

    public void setTogglestr(String togglestr) {
        this.togglestr = togglestr;
    }

    public String getReversestr() {
        return reversestr;
    }

    public void setReversestr(String reversestr) {
        this.reversestr = reversestr;
    }
    
    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    StringWriter s=new StringWriter();
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        int j,i;
        
        try {
            
            charreverse=reversestr.toCharArray();
            chartoggle=togglestr.toCharArray();
            i=charreverse.length-1;
            j=0;
            while( i>=0)
            {
                 out.print(charreverse[i]);
                 i--;
            }
            while( j<=chartoggle.length-1)
            {
                int ch=chartoggle[j];
                if(ch>=65 && ch<=90)
                    ch=ch+32;
                else
                    ch=ch-32;
                char ch1=(char)ch;
                 out.print(ch1);
                 j++;
            }
          
        } catch (Exception ex) {
            throw new JspException("Error in StringCustomAttribute tag", ex);
        }
    }
    
}
