package com.example.geoquiz;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import android.content.Intent;

public class MainActivity extends AppCompatActivity {
    private Button mTrueButton;
    private Button mFalseButton;
    private Button mNextButton;
    private Button mCheatButton;
    private int mCurrentIndex=0;
    private Question[] mQuestionBank=new Question[]{
            new Question(R.string.question_ocean,true),
            new Question(R.string.question_nile,false)
    };
    private TextView mTextViewQuestion;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mTextViewQuestion=(TextView) findViewById(R.id.text_view_question);


        mTrueButton = (Button) findViewById(R.id.true_button);
        mTrueButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                checkAnswer(true);
            }
        });

        mFalseButton = (Button) findViewById(R.id.false_button);
        mFalseButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                checkAnswer(false);


            }
        });

        mNextButton = (Button) findViewById(R.id.next_button);
        mNextButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mCurrentIndex=(mCurrentIndex+1)%mQuestionBank.length;
                updateQuestion();


            }
        });
        mCheatButton=(Button) findViewById(R.id.cheat_button);
        mCheatButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Toast.makeText(MainActivity.this,"Cheat is wrong!",Toast.LENGTH_LONG);
                //boolean mAnswer=mQuestionBank[mCurrentIndex].isAnswerTrue();

                Intent in=new Intent(MainActivity.this,CheatActivity.class);
                in.putExtra("dummy_message",String.valueOf(30));
                startActivity(in);
            }
        });

        updateQuestion();

    }
    public void updateQuestion(){
        int quest=mQuestionBank[mCurrentIndex].getResId();
        mTextViewQuestion.setText(quest);

    }
    public void checkAnswer(boolean buttonAnswer){
        boolean actualAnswer=mQuestionBank[mCurrentIndex].isAnswerTrue();
        if(buttonAnswer==actualAnswer){
            Toast.makeText(this,"Correct",Toast.LENGTH_LONG).show();

        }
        else{
            Toast.makeText(this,"Incorrect",Toast.LENGTH_LONG).show();
        }

    }
}