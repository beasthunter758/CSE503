package com.example.uilistview;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private ListView mListView;
    private GridView mGridView;
    private ArrayAdapter<String> mAdap;
    private String arr[]={"Progamming in C","Data Structures","Programming in Python", "Introduction to Web Development"};
   /* private String [] arr={"1","2","3","4","5","6","7","8"};
*/
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //mGridView=findViewById(R.id.grid_id);
      mListView=findViewById(R.id.list_id);

        mAdap=new ArrayAdapter<String>(this,R.layout.support_simple_spinner_dropdown_item,arr);
       // mAdap= new ArrayAdapter<String>(this,android.R.layout.simple_list_item_1,arr);

        //mAdap=new ArrayAdapter<String>(this,R.layout.text_menu,R.id.text_id,arr);
        mListView.setAdapter(mAdap);
        mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent in=new Intent(MainActivity.this,OtherActivity.class);
                in.putExtra("dummy_message",String.valueOf(position));
                startActivity(in);
            }
        });


        //mGridView.setAdapter(mAdap);

    }
}