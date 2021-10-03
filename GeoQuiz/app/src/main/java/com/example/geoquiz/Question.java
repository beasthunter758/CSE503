package com.example.geoquiz;

public class Question {
    private int mResId;
    private boolean mAnswer;
    Question (int ResId, boolean answer){
        mResId=ResId;
        mAnswer=answer;
    }
    public boolean isAnswerTrue(){
        return mAnswer;
    }
    public int getResId(){
        return mResId;
    }
}
