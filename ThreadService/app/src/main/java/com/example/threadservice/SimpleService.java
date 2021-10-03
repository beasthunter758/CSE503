package com.example.threadservice;

import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.media.MediaPlayer;
import android.widget.Toast;

public class SimpleService extends Service implements Runnable{
    private MediaPlayer mMedia;
    @Override public IBinder onBind(Intent arg){
        return null;

    }
    @Override
    public void onCreate() {
        //super.onCreate(savedInstanceState);
       // setContentView(R.layout.activity_main);
        Toast.makeText(this,"Service created",Toast.LENGTH_LONG).show();
        Thread mThread=new Thread(this);
        mThread.start();

    }

    @Override public void run(){
        mMedia=MediaPlayer.create(this,R.raw.kalhonaho);
        mMedia.start();
    }

    @Override public void onDestroy(){
        Toast.makeText(this,"Service destroyed",Toast.LENGTH_LONG).show();
        mMedia.stop();

    }


}
