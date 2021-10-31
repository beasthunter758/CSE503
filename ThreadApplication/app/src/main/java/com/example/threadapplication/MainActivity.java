package com.example.threadapplication;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.os.Looper;
import android.os.Handler;
import android.view.View;
import android.widget.TextView;
import android.widget.Button;
import android.os.Message;


public class MainActivity extends AppCompatActivity {
    private TextView evennos;
    private TextView primenos;
    private Button answer;
    private Button clear;
    private Handler evennosHandler;
    private Handler primenosHandler;
    String evenNosValue = "";
    String primeNosValue = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        evennos = (TextView) findViewById(R.id.even_numbers);
        primenos = (TextView) findViewById(R.id.prime_nos);
        answer = (Button) findViewById(R.id.answers);
        clear = (Button) findViewById(R.id.clear);


        evennosHandler = new Handler(Looper.getMainLooper()) {
            @Override
            public void handleMessage(Message msg) {
                if (msg.obj == "END") {
                    evennos.setText(evenNosValue);
                    return;
                }
                evenNosValue = evenNosValue + String.valueOf(msg.obj) + " ";
            }
        };
        primenosHandler = new Handler(Looper.getMainLooper()) {
            @Override
            public void handleMessage(Message msg) {
                if (msg.obj == "END") {
                    primenos.setText(primeNosValue);
                    return;
                }
                primeNosValue = primeNosValue + String.valueOf(msg.obj) + " ";
            }
        };
        EvennoRunnable evennoRunnable = new EvennoRunnable();
        Thread evennoThread = new Thread(evennoRunnable);
        evennoThread.start();

        PrimenoRunnable primenoRunnable = new PrimenoRunnable();
        Thread primenoThread = new Thread(primenoRunnable);
        primenoThread.start();

        answer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                evennos.setText(evenNosValue);
                primenos.setText(primeNosValue);
            }

        });

        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                evennos.setText("");
                primenos.setText("");
            }

        });
    }


    class EvennoRunnable implements Runnable {
        @Override
        public void run() {
            for (int i = 1; i <= 100; i++) {
                if (i % 2 == 0) {
                    Message answer = Message.obtain();
                    answer.obj = i;
                    evennosHandler.sendMessage(answer);
                }

            }
            Message endMessage = Message.obtain();
            endMessage.obj = "END";
            evennosHandler.sendMessage(endMessage);
        }
    }

    class PrimenoRunnable implements Runnable {
        @Override
        public void run() {
            for (int i = 1; i <= 100; i++) {
                int c = 0;
                for (int j = 1; j <= i; j++) {
                    if (i % j == 0) {
                        c++;
                    }
                }
                if (c == 2) {
                    Message answer = Message.obtain();
                    answer.obj = i;
                    primenosHandler.sendMessage(answer);
                }

            }
            Message endMessage = Message.obtain();
            endMessage.obj = "END";
            primenosHandler.sendMessage(endMessage);

        }
    }
}
