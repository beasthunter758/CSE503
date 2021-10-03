package com.example.geoquiz;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.content.Intent;

public class CheatActivity extends AppCompatActivity {
    private Button showAnswer;
    private TextView mAnswerView;
    private boolean mAnswerTrue;
    private String mValue;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cheat);
        mAnswerView=(TextView)findViewById(R.id.text_view_answer);
        showAnswer= (Button)findViewById(R.id.answer_button);
        mValue=getIntent().getStringExtra("dummy_message");

        //mAnswerTrue=getIntent().getBooleanExtra("dummy_message",false);

        showAnswer.setOnClickListener(new View.OnClickListener(){
            @Override public void onClick(View v){
                mAnswerView.setText(mValue);

                /*if(mAnswerTrue){
                    mAnswerView.setText(R.string.true_button);
                    mAnswerView.setText(R.string.true_button);

                }
                else{
                    mAnswerView.setText(R.string.false_button);

                }*/


            }
        });

    }
}