package com.example.uilistview;

import android.os.Bundle;
import android.webkit.WebView;


import androidx.appcompat.app.AppCompatActivity;

public class OtherActivity extends AppCompatActivity {
    private WebView mWebView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_other);
        mWebView=findViewById(R.id.web_id);
        String value=getIntent().getStringExtra("dummy_message");
        switch(Integer.parseInt(value)){
            case 0:
                String pc="<p>\n"+
                        "the syllabus of Programming in C:\n"+
                        "<ul>"+
                        "<li>Data Types</li>"+
                        "<li>Arrays</li>"+
                        "<li>Pointers</li>"+
                        "<li>Structures</li>\n"+
                        "</ul>"+
                        "</p>";
                mWebView.loadDataWithBaseURL(null,pc,"text/html","utf-8",null);
                break;
            case 1:
                String ds="<p>\n"+
                        "The syllabus of Data Structures:"+
                        "<ul>"+
                        "<li>Stacks</li>"+
                        "<li>Queues</li>"+
                        "<li>Trees</li>"+
                        "<li>Graphs</li>"+
                        "</ul>"+
                        "</p>";
                mWebView.loadDataWithBaseURL(null,ds,"text/html","utf-8",null);

                break;
            default:


        }



    }
}
