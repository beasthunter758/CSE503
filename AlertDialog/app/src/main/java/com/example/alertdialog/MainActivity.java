package com.example.alertdialog;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {
    private Button mShowResult;
    private Button mStop;
    int mScore=3,mTotalScore=5;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mShowResult=findViewById(R.id.show_id);
        mStop=findViewById(R.id.stop_id);
        mShowResult.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AlertDialog mAlert=new AlertDialog.Builder(MainActivity.this).create();
                mAlert.setTitle("Question Score");
                mAlert.setMessage("The Score is"+mScore+"/"+mTotalScore);
                OnClickListener mOnClick=new OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //Toast.makeText(MainActivity.this,"Ok",Toast.LENGTH_LONG);
                        switch (which){
                            case DialogInterface.BUTTON_POSITIVE:
                                dialog.dismiss();
                                break;
                            case DialogInterface.BUTTON_NEGATIVE:
                                MainActivity.this.finish();
                                break;

                        }


                    }
                };

                mAlert.setButton(DialogInterface.BUTTON_POSITIVE,"Go to main menu",mOnClick);
                mAlert.setButton(DialogInterface.BUTTON_NEGATIVE,"Stop",mOnClick);
                mAlert.show();

            }
        });



    }
}